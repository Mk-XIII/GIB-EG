import 'package:GIB_EG/objects/eggs/Egg.dart';
import 'package:GIB_EG/utilities/particles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

class InteractiveEggButton extends StatefulWidget {
  final Egg egg;
  final void Function() onPressed;
  final UI.Image currenceImage;

  InteractiveEggButton({@required this.egg, @required this.onPressed(), @required this.currenceImage});

  @override
  _InteractiveEggButtonState createState() => _InteractiveEggButtonState();
}

class _InteractiveEggButtonState extends State<InteractiveEggButton> { 
  Offset offset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Image.asset(widget.egg.sprite, width: 256, height: 256),
        Particles(
          duration: const Duration(milliseconds: 500),
          builder: (context, controller) {
            if(offset != null) {
              print('should animation begin');
              controller.reset();
              controller.forward();
            }

            return GestureDetector(
              onTapDown: (TapDownDetails details) 
              { 
                print('tap down');
                offset = _onTapDown(details);
              },
              onTap: () {
                print('on tap');
                this.widget.onPressed();
                setState(() {});
              },
            );
          },
          particle: Burst(
            children: offset != null ? List<Particle>.generate(1, (i) => FadingImage(offset: offset, image: widget.currenceImage,)) : List<Particle>(),
          ),
          ),
      ],
    );
  }

  Offset _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap down " + x.toString() + ", " + y.toString());
    return details.localPosition;
  }
}