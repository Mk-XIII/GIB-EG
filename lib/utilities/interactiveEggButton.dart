import 'package:GIB_EG/objects/eggs/Egg.dart';
import 'package:GIB_EG/utilities/particles.dart';
import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';
import 'dart:ui' as UI;

class InteractiveEggButton extends StatefulWidget {
  final Egg egg;
  final void Function() onPressed;
  final UI.Image currencyImage;

  InteractiveEggButton(
      {@required this.egg,
      @required this.onPressed(),
      @required this.currencyImage});

  @override
  _InteractiveEggButtonState createState() => _InteractiveEggButtonState();
}

class _InteractiveEggButtonState extends State<InteractiveEggButton> {
  List<Particles> particles = []; //might cause poblems if user stays at egg page for too long and taps too much

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(widget.egg.sprite,
            width: widget.egg.image.width.toDouble(),
            height: widget.egg.image.height.toDouble()),
            
        ...particles.toList(),
        
        ImagePixels(
            imageProvider: AssetImage(widget.egg.sprite),
            builder: (context, ImgDetails img) {
              return GestureDetector(
                onTapDown: (TapDownDetails details) {
                  Offset particlesOffset = _getOffset(details);
                  int halfOfHeightEmptyness = (context.size.height.toInt() - widget.egg.image.height) ~/ 2;
                  int halfOfWidthEmptyness = (context.size.width.toInt() - widget.egg.image.width) ~/ 2;
                  
                  //print(context.size);
                  if(halfOfHeightEmptyness < particlesOffset.dy.toInt() && particlesOffset.dy.toInt() < halfOfHeightEmptyness + widget.egg.image.height) {
                    if(halfOfWidthEmptyness < particlesOffset.dx.toInt() && particlesOffset.dx.toInt() < halfOfWidthEmptyness + widget.egg.image.width) {
                      if(img.pixelColorAt(particlesOffset.dx.toInt() - halfOfWidthEmptyness, particlesOffset.dy.toInt() - halfOfHeightEmptyness) != Colors.transparent) {
                        particles.add(
                          Particles(
                            builder: (context, controller) {
                              controller.forward();
                              return Container();
                            },
                            particle: FadingImage(
                              offset: particlesOffset,
                              image: widget.currencyImage,
                            ),
                            duration: Duration(seconds: 3),
                          )
                       );
                      }
                    }
                  }
                  setState(() {});
                },
              );
            }),
      ],
    );
  }

  Offset _getOffset(TapDownDetails details) {
    return details.localPosition;
  }
}
