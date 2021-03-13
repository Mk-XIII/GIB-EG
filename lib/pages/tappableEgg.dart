import 'package:GIB_EG/utilities/interactiveEggButton.dart';
import 'package:GIB_EG/objects/eggs/BasicEgg.dart';
import 'package:GIB_EG/objects/eggs/Egg.dart';
import 'package:GIB_EG/objects/eggs/FancyEgg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

class TappableEgg extends StatefulWidget {
  final UI.Image currencyImage;

  const TappableEgg({@required this.currencyImage});

  @override
  _TappableEggState createState() => _TappableEggState();
}

class _TappableEggState extends State<TappableEgg> { 
  int _currentIndex = 0;
  List<Egg> _eggs = [
    BasicEgg(),
    FancyEgg(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_left_rounded),
                iconSize: 50.0,
                onPressed: () {
                  _currentIndex = 0;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: InteractiveEggButton(
                  egg: _eggs[_currentIndex],
                  onPressed: () {},
                  currencyImage: widget.currencyImage,
                ),
              ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_right_rounded),
                iconSize: 50.0,
                onPressed: () {
                  _currentIndex = 1;
                  setState(() {});
                  print(_eggs[_currentIndex].sprite);
                },
              ),
            ),
          ],
        ),
      ),
      //TODO: create background images for each egg type
      backgroundColor: Colors.cyan[400],
    );
  }
}