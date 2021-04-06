import 'package:GIB_EG/models/booster.dart';
import 'package:GIB_EG/models/player.dart';
import 'package:flutter/material.dart';

import 'components/shop_header.dart';
import 'components/shop_item.dart';
import 'components/shop_type_button.dart';

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