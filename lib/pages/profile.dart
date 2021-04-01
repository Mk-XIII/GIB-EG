import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//TODO: implement

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "PLACEHOLDER",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sprites/background.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
