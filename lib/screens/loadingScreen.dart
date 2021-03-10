import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    changePage('/homeScreen');
  }

  void changePage(String route) async {
    //displays loading screen for 2 seconds, for testing purpose
    await Future.delayed(const Duration(seconds: 2), (){});
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
