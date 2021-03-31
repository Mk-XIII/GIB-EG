import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GIB_EG/widgets/shop_item.dart';

class Shop extends StatefulWidget {
  final Player player;

  const Shop({@required this.player});

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sprites/background.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(EgCons.trading,
                          size: 50, color: Color.fromRGBO(255, 231, 231, 100)),
                      Text(
                        "SHOP",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(EgCons.currency,
                          size: 50, color: Color.fromRGBO(255, 231, 231, 100)),
                      SizedBox(width: 10),
                      Text(
                        widget.player.getMoney().toString(),
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "EG SHOP",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  margin: const EdgeInsets.all(15.0),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                ),
                Container(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "MY TRADES",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  margin: const EdgeInsets.all(15.0),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(7.5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("BOOSTERS", style: TextStyle(color: Colors.white, fontSize: 25),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ShopItem(
                            itemName: "Whetstone",
                            price: "100",
                            icon: EgCons.profile,
                            description: "+% to get a better quality item",
                          ),
                        ),
                        Expanded(
                          child: ShopItem(
                            itemName: "Yellow spray can",
                            price: "50",
                            icon: EgCons.achievement,
                            description: "+% to sold item value",
                          ),
                        ),
                        Expanded(
                          child: ShopItem(
                            itemName: "Magnifying glass",
                            price: "200",
                            icon: EgCons.currency,
                            description: "+% to get a better item",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShopItem(
                          itemName: "Broken mirror",
                          price: "300",
                          icon: EgCons.champion_cup,
                          description: "+% to get two items instead of one",
                        ),
                        ShopItem(
                          itemName: "Golden feather",
                          price: "500",
                          icon: EgCons.settings,
                          description: "Clicking eg generates gold",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: SizedBox(width: double.infinity, height: 8.0),
            ),
        ],
      ),
    );
  }
}
