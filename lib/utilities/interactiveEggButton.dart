import 'package:GIB_EG/models/eggs/Egg.dart';
import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/utilities/particles.dart';
import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';
import 'dart:ui' as UI;

class InteractiveEggButton extends StatefulWidget {
  final Egg egg;
  final void Function() onPressed;
  final UI.Image currencyImage;
  final List<UI.Image> numbers;
  Player player;

  InteractiveEggButton({
    @required this.egg,
    @required this.onPressed(),
    @required this.currencyImage,
    @required this.numbers});

  @override
  _InteractiveEggButtonState createState() => _InteractiveEggButtonState();
}

class _InteractiveEggButtonState extends State<InteractiveEggButton> {
  List<Particles> particles = [];
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(widget.egg.sprite,
            width: widget.egg.width, height: widget.egg.height),
        ...particles.toList(),
        ImagePixels(
            imageProvider: AssetImage(widget.egg.sprite),
            builder: (context, ImgDetails img) {
              return GestureDetector(
                onTapDown: (TapDownDetails details) {

                  Offset particlesOffset = _getOffset(details);

                  if (_onEgg(img, (context.size.height - widget.egg.height) / 2, (context.size.width - widget.egg.width) / 2, particlesOffset.dx.toInt(), particlesOffset.dy.toInt())) {
                    if(!widget.egg.sustainedClick()) {
                      Color colorado = widget.egg.dropItem();//change to item later on
                      widget.onPressed();

                      particles.add(Particles(
                        key: UniqueKey(),
                        builder: (context, controller) {
                          controller.forward();
                          return Container();
                        },
                        particle: RarityParticles(
                          children: List<Particle>.generate(125, (count) => 
                            ColoredCircle(
                              color: colorado,
                              offset: particlesOffset,
                              radius: Randoms.rnd.nextInt(25).toDouble()))
                          ),
                          duration: Duration(milliseconds: 900),
                        ),
                      );
                    }
                  }
                  
                  setState(() {
                    while(particles.length > 20) {
                      particles.removeAt(0);
                    }
                  });
                },
              );
            }),
      ],
    );
  }

  Offset _getOffset(TapDownDetails details) => details.localPosition;

  bool _onEgg(ImgDetails img, double halfOfHeightEmptyness,  double halfOfWidthEmptyness, int dx, int dy) {
    return halfOfHeightEmptyness < dy &&
        dy < halfOfHeightEmptyness + widget.egg.height &&
        halfOfWidthEmptyness < dx &&
        dx < halfOfWidthEmptyness + widget.egg.width &&
        img.pixelColorAt(dx - halfOfWidthEmptyness.toInt(), dy.toInt() - halfOfHeightEmptyness.toInt()) != Colors.transparent;
  }
}
