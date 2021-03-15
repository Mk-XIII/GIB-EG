import 'dart:math' as math;
import 'dart:ui' as UI;

import 'package:flutter/material.dart';

abstract class Particle implements Drawable, Updatable {
  @override
  void draw(Canvas canvas, Size size) {
    // Does nothing by default
  }

  @override
  void update(Animation controller) {
    // Does nothing by default
  }
}

mixin Drawable {
  void draw(Canvas canvas, Size size);
}

mixin Updatable {
  void update(Animation animation);
}

mixin Moving on Updatable {
  Offset from;
  Offset to;
  Offset current;

  @override
  void update(Animation animation) {
    current = Offset.lerp(from, to, animation.value);
  }
}

mixin Curved on Updatable {
  Curve curve;

  @override
  void update(Animation animation) {
    super.update(
      CurveTween(curve: curve).animate(animation),
    );
  }
}

class CurvedParticle extends Particle with NestedParticle, Curved {
  Curve curve;
  Particle child;

  CurvedParticle({
    @required this.curve,
    @required this.child,
  });
}

class MovingParticle extends Particle with Moving, NestedParticle {
  MovingParticle({
    @required Offset from,
    @required Offset to,
    @required Particle child,
  }) {
    this.from = from;
    this.to = to;
    this.child = child;
  }

  @override
  void draw(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(current.dx, current.dy);
    super.draw(canvas, size);
    canvas.restore();
  }
}

mixin Fading on Updatable {
  FadingDirection direction = FadingDirection.fadeOut;
  double opacity;

  @override
  void update(Animation controller) {
    if (direction == FadingDirection.fadeOut) {
      opacity = (1 - controller.value);
    } else {
      opacity = controller.value;
    }
  }
}

mixin CompositeParticle on Particle {
  List<Particle> children;

  @override
  void draw(Canvas canvas, Size size) {
    super.draw(canvas, size);

    for (var child in children) {
      child.draw(canvas, size);
    }
  }

  @override
  void update(Animation controller) {
    super.update(controller);

    for (var child in children) {
      child.update(controller);
    }
  }
}

class Randoms {
  static final rnd = math.Random();

  static Offset offsetFromSizetoCircle(Size size) {
    double r = size.height / 2 * math.sqrt(Randoms.rnd.nextDouble());
    double theta = Randoms.rnd.nextDouble() * 2 * math.pi;


    return Offset(
      r * math.cos(theta),
      r * math.sin(theta),
    );
  }

  static Offset offsetFromSizetoSky(Size size) {
    return Offset(
      Randoms.rnd.nextDouble() * size.width / 2 - size.width,
      Randoms.rnd.nextDouble() * size.height / 2,
    );
  }
}

mixin Scaling on Updatable {
  double from = 0;
  double to = 1;
  double current;

  @override
  void update(Animation controller) {
    current = UI.lerpDouble(from, to, controller.value);
  }
}

mixin NestedParticle on Particle {
  Particle child;

  @override
  void draw(Canvas canvas, Size size) {
    super.draw(canvas, size);
    child.draw(canvas, size);
  }

  @override
  void update(Animation controller) {
    super.update(controller);
    child.update(controller);
  }
}

class RarityParticles extends Particle with CompositeParticle {
    List<Particle> children;

    RarityParticles({
      @required List<Particle> children,
      Size size = const Size(400, 400),
    }) {
      this.children = children
          .map<Particle>(
            (particle) => CurvedParticle(
              curve: Curves.easeOutQuad,
              child: MovingParticle(
                from: Offset.zero,
                to: Randoms.offsetFromSizetoCircle(size),
                child: particle,
              ),
            ),
          )
          .toList();
    }
}

class ColoredCircle extends Particle with Fading {
  Offset offset;
  Color color;
  double radius;

  ColoredCircle({
    @required this.offset,
    @required this.radius,
    @required this.color,
  });

  @override
  void draw(Canvas canvas, Size size) {
    canvas.save();
    canvas.drawCircle(offset, radius,
        Paint()..color = color.withOpacity(opacity));
    canvas.restore();
  }
}

class ScalingParticle extends Particle with Scaling, NestedParticle {
  double from;
  double to;
  Particle child;

  ScalingParticle({
    this.from = 1.0,
    this.to = 1,
    @required this.child,
  });

  @override
  void draw(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(current);
    super.draw(canvas, size);
    canvas.restore();
  }
}


class FadingImage extends Particle with Fading {
  UI.Image image;
  Offset offset;

  FadingImage({
    @required this.offset,
    @required this.image,
  });

  @override
  void draw(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(-20, -20);
    canvas.drawImage(image, offset,
        Paint()..color = Colors.transparent.withOpacity(opacity));
    canvas.restore();
  }
}

class ParticlePainter extends CustomPainter {
  final Animation controller;
  final Particle particle;

  ParticlePainter({@required this.controller, @required this.particle}) {
    particle.update(controller);
  }

  @override
  void paint(Canvas canvas, Size size) {
    particle.draw(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

enum FadingDirection { fadeIn, fadeOut }

typedef ParticlesWidgetBuilder = Widget Function(
  BuildContext context,
  AnimationController controller,
);

typedef ParticleProvider = Particle Function(int i);

class ParticleGenerator extends Particle with CompositeParticle {
  List<Particle> children;

  ParticleGenerator(
    int count,
    ParticleProvider generator,
  ) {
    this.children = List<Particle>.generate(count, generator);
  }
}

class Particles extends StatefulWidget {
  final Duration duration;
  final Particle particle;
  final ParticlesWidgetBuilder builder;
  final Curve curve;

  Particles({
    @required Key key,
    @required this.particle,
    @required this.builder,
    @required this.duration,
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    animation = CurvedAnimation(curve: widget.curve, parent: controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          child: child,
          painter: ParticlePainter(
            controller: controller,
            particle: widget.particle,
          ),
        );
      },
      child: widget.builder(context, controller),
    );
  }
}
