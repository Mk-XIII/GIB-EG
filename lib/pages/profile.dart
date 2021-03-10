import 'package:flutter/material.dart';
//TODO: implement

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('PROFILE PAGE'),//placeholder
      ),

      backgroundColor: Colors.greenAccent[400],
    );
  }
}
