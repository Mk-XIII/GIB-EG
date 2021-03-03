import 'package:flutter/material.dart';
import 'package:flutter_application_1/objects/eggs/BasicEgg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BasicEgg currentEgg = BasicEgg();//for testing purpose later should be modified

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                currentEgg.clicksToBreak.toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //TODO: make clickable area to represent an egg
              GestureDetector(
                onTap: () {
                  currentEgg.sustainedClick();//TODO: add logic
                  setState(() {});
                },
                child: Image.asset(
                  'assets/sprites/egg.png',//should be changed depending on egg
                  width: 200.0,//should be changed depending on egg
                  height: 200.0,//should be changed depending on egg
                ),
              )
            ],
          ),
        ),
      ),
      //TODO: create background images for each egg type
      backgroundColor: Colors.cyan[400],
      //TODO: add routing to other pages
      //TODO: change navigation bar style
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: 'Inventory'),
          BottomNavigationBarItem(
              icon: Icon(Icons.portrait_rounded),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Some random fucking shit'),
        ],
      ),
    );
  }
}
