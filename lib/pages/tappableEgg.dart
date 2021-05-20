import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:GIB_EG/utilities/interactiveEggButton.dart';
import 'package:GIB_EG/models/eggs/Egg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:ui' as UI;

class TappableEgg extends StatefulWidget {
  final UI.Image currencyImage;

  const TappableEgg({@required this.currencyImage});

  @override
  _TappableEggState createState() => _TappableEggState();
}

class _TappableEggState extends State<TappableEgg> {
  int _currentIndex = 0;
  List<Egg> _eggs;

  @override
  void initState() {
    // TODO: implement initState
    _eggs = Provider.of<Player>(context, listen: false).getEgs();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(EgCons.currency,
                            size: 50,
                            color: Color.fromRGBO(255, 231, 231, 100)),
                        SizedBox(
                          width: 10,
                        ),
                        Consumer<Player>(
                          builder: (context, player, child) => Text(
                            player.getMoney().toString(),
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Consumer<Player>(
                          builder: (context, player, child) {
                            return player.isBoosterActive()
                                ? Icon(
                                    Icons.alarm_on,
                                    size: 50,
                                    color: Color.fromRGBO(255, 231, 231, 100),
                                  )
                                : SizedBox.shrink();
                          },
                        ),
                        Icon(EgCons.achievement,
                            size: 50,
                            color: Color.fromRGBO(255, 231, 231, 100)),
                        Icon(EgCons.settings,
                            size: 50,
                            color: Color.fromRGBO(255, 231, 231, 100)),
                      ],
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
                          _currentIndex = (_currentIndex - 1) % _eggs.length;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: InteractiveEggButton(
                        egg: _eggs[_currentIndex],
                        onPressed: () {
                          //Provider basically containes the current state of whatever object you specify.
                          //You can access the provider from anywhere.
                          //listen: false means that we shouldn't rerender the whole widget
                          var player =
                              Provider.of<Player>(context, listen: false);
                          
                          player.addMoney(_eggs[_currentIndex].dropCurrency());
                        },
                        currencyImage: widget.currencyImage,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right_rounded),
                        iconSize: 50.0,
                        onPressed: () {
                          
                          _currentIndex = (_currentIndex + 1) % _eggs.length;
                          
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
