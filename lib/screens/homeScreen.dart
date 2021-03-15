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
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)
        .settings
        .arguments; //might need to update only once

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          TappableEgg(
            currencyImage: data['currencyImage'],
          ),
          Inventory(),
          Profile(), //placeholder
          Profile(),
        ],
      ),

      //TODO: change navigation bar style
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0, //gets rid of the shadow
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //TODO: decide on transition style
          children: <Widget>[
            Expanded(
              child: IconButton(
                iconSize: 65,
                icon: Image.asset("assets/icons/egg.png"),
                onPressed: () {
                  _controller.animateToPage(
                    0,
                    duration: Duration(milliseconds: 750),
                    curve: Curves.decelerate,
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                iconSize: 65,
                icon: Image.asset("assets/icons/template1.png"),
                onPressed: () {
                  _controller.animateToPage(
                    1,
                    duration: Duration(milliseconds: 750),
                    curve: Curves.decelerate,
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                iconSize: 65,
                icon: Image.asset("assets/icons/template1.png"),
                onPressed: () {
                  _controller.animateToPage(
                    2,
                    duration: Duration(milliseconds: 750),
                    curve: Curves.decelerate,
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                iconSize: 65,
                icon: Image.asset("assets/icons/template1.png"),
                onPressed: () {
                  _controller.animateToPage(
                    3,
                    duration: Duration(milliseconds: 750),
                    curve: Curves.decelerate,
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                iconSize: 65,
                icon: Image.asset("assets/icons/profile.png"),
                onPressed: () {
                  _controller.animateToPage(
                    4,
                    duration: Duration(milliseconds: 750),
                    curve: Curves.decelerate,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
