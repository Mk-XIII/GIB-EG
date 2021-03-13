import 'package:GIB_EG/objects/eggs/Egg.dart';
import 'package:GIB_EG/utilities/particles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

class InteractiveEggButton extends StatefulWidget {
  final Egg egg;
  final void Function() onPressed;
  final UI.Image currencyImage;

  InteractiveEggButton({@required this.egg, @required this.onPressed(), @required this.currencyImage});

  @override
  _InteractiveEggButtonState createState() => _InteractiveEggButtonState();
}

class _InteractiveEggButtonState extends State<InteractiveEggButton> { 
  List<Particles> particles = List<Particles>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(widget.egg.sprite, width: 256, height: 256),
        ...particles.toList(),
        GestureDetector(
            onTapDown: (TapDownDetails details) {
              Offset particlesOffset = _getOffset(details);
              particles.add(
                Particles(
                  builder: (context, controller) {
                    controller.forward();
                    return Container();
                  },
                  particle: FadingImage(offset: particlesOffset, image: widget.currencyImage,),
                  duration: Duration(seconds: 3),
                  ),
                );
              print(particles.length);
              setState(() { });
            },          
          ),
      ],
    );
  }

  Offset _getOffset(TapDownDetails details) {
    return details.localPosition;
  }
}