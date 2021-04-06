import 'package:GIB_EG/models/booster.dart';
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
      child: Column(
        children: [
          ShopHeader(money: widget.player.getMoney().toString()),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShopTypeButton(text: "EG SHOP"),
                ShopTypeButton(text: "MY TRADES"),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(7.5),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 18.0),
                              child: Text(
                                "BOOSTERS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: getShopItems(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

List<ShopItem> getShopItems() {
  List<ShopItem> shopItemList = [];

  boosters.forEach((element) {
    shopItemList.add(ShopItem(booster: element));
  });
  return shopItemList;
}

class ShopTypeButton extends StatelessWidget {
  final String text;

  const ShopTypeButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      margin: const EdgeInsets.all(15.0),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
      ),
    );
  }
}

class ShopHeader extends StatelessWidget {
  final String money;
  const ShopHeader({@required this.money});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                this.money,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
