import 'package:flutter/material.dart';
import 'package:GIB_EG/pages/inventory.dart';
import 'package:GIB_EG/pages/profile.dart';
import 'package:GIB_EG/pages/tappableEgg.dart';
//for now it's looking like stateless widget

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            TappableEgg(),
            Inventory(),
            Profile(),//placeholder
            Profile(),
          ],
          ),
        ),

      //TODO: change navigation bar style
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,//gets rid of the shadow
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //TODO: decide on transition style
          children: <Widget>[
            IconButton(
              iconSize: 60,
              icon: Image.asset("assets/icons/template1.png"),
               onPressed: () {
                 _controller.animateToPage(
                   0,
                   duration: Duration(milliseconds: 750),
                   curve: Curves.decelerate,             
                   );
               },
            ),
            IconButton(
              iconSize: 60,
              icon: Image.asset("assets/icons/template1.png"),
              onPressed: () {
                _controller.animateToPage(
                   1,
                   duration: Duration(milliseconds: 750),
                   curve: Curves.decelerate,             
                   );
              },
            ),
            IconButton(
              iconSize: 60,
              icon: Image.asset("assets/icons/template1.png"),
              onPressed: () {
                _controller.animateToPage(
                   2,
                   duration: Duration(milliseconds: 750),
                   curve: Curves.decelerate,             
                   );
              },
            ),
            IconButton(
              iconSize: 60,
              icon: Image.asset("assets/icons/profile.png"),
              onPressed: () {
                _controller.animateToPage(
                   3,
                   duration: Duration(milliseconds: 750),
                   curve: Curves.decelerate,             
                   );
              },
            ),
          ],
        ),
      ),
    );
  }
}