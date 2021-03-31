import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:GIB_EG/utilities/interactiveEggButton.dart';
import 'package:GIB_EG/models/eggs/BasicEgg.dart';
import 'package:GIB_EG/models/eggs/Egg.dart';
import 'package:GIB_EG/models/eggs/FancyEgg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as UI;

class TappableEgg extends StatefulWidget {
  final UI.Image currencyImage;
  final List<UI.Image> numbers;
  final Player player;

  const TappableEgg(
      {@required this.currencyImage,
      @required this.numbers,
      @required this.player});

  @override
  _TappableEggState createState() => _TappableEggState();
}

class _TappableEggState extends State<TappableEgg> {
  int _currentIndex = 0;
  List<Egg> _eggs;

  @override
  void initState() {
    // TODO: implement initState
    _eggs = [
      BasicEgg(),
      FancyEgg(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sprites/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(EgCons.currency,
                              size: 50,
                              color: Color.fromRGBO(255, 231, 231, 100)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.player.getMoney().toString(),
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
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
                      flex: 4,
                      child: InteractiveEggButton(
                        egg: _eggs[_currentIndex],
                        player: widget.player,
                        onPressed: () {
                          widget.player
                              .addMoney(_eggs[_currentIndex].dropCurrency());
                          widget.player.displayMoney();
                          setState(() {});
                        },
                        currencyImage: widget.currencyImage,
                        numbers: widget.numbers,
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
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
