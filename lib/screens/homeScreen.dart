import 'package:GIB_EG/pages/tappableEgg.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:GIB_EG/screens/profile_screen/profile_screen.dart';
import 'package:GIB_EG/screens/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';

import 'inventory_screen/inventory.dart';

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
      resizeToAvoidBottomInset : false,//prevents widgets resizing when keyboard appears
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/sprites/background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                TappableEgg(
                  currencyImage: data['currencyImage'],
                  numbers: data['numbers'],
                ),
                Inventory(),
                ProfileScreen(), 
                ProfileScreen(),
                Shop(),

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data:
                  Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: BottomAppBar(
                color: Colors.transparent,
                elevation: 0, //gets rid of the shadow
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //TODO: decide on transition style
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        iconSize: 65,
                        icon: Icon(
                          EgCons.template2,
                          color: Colors.white,
                        ),
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
                        icon: Icon(
                          EgCons.currency,
                          color: Colors.white,
                        ),
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
                        icon: Icon(
                          EgCons.template1,
                          color: Colors.white,
                        ),
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
                        icon: Icon(
                          EgCons.profile,
                          color: Colors.white,
                        ),
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
                        icon: Icon(
                          EgCons.trading,
                          color: Colors.white,
                        ),
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
            ),
          ),
        ],
      ),
    );
  }
}
