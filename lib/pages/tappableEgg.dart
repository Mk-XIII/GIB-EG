import 'package:flutter/material.dart';
import 'package:GIB_EG/objects/eggs/BasicEgg.dart';
import 'package:GIB_EG/objects/eggs/Egg.dart';
import 'package:GIB_EG/objects/eggs/FancyEgg.dart';

class TappableEgg extends StatefulWidget {
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
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_arrow_left_rounded),
              iconSize: 50.0,
              onPressed: () {
                _currentIndex = 0;
                setState(() {});
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _eggs[_currentIndex].clicksToBreak.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                //TODO: make clickable area to represent an egg
                GestureDetector(
                  onTap: () {
                     _eggs[_currentIndex].sustainedClick();//TODO: add logic
                    setState(() {});
                  },
                  
                  child: Image.asset(
                    _eggs[_currentIndex].sprite,//should be changed depending on egg
                    width: 250.0,//should be changed depending on egg
                    height: 250.0,//should be changed depending on egg
                  ),
                )
              ],
            ),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right_rounded),
              iconSize: 50.0,
              onPressed: () {
                _currentIndex = 1;
                setState(() {});
                print(_eggs[_currentIndex].sprite);
              },
            ),
          ],
        ),
      ),
      //TODO: create background images for each egg type
      backgroundColor: Colors.cyan[400],
    );
  }
}