import 'package:GIB_EG/models/booster.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:GIB_EG/screens/shop_screen/components/shop_item_popup.dart';
import 'package:flutter/material.dart';


class ShopItem extends StatelessWidget {
  final Booster booster;

  const ShopItem(
      {@required this.booster});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ShopItemPopup(
                booster: this.booster
              );
            });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              child: Text(
                this.booster.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 7),
            Icon(this.booster.icon, size: 50, color: Colors.white),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(EgCons.currency,
                    size: 20, color: Color.fromRGBO(255, 231, 231, 100)),
                Text(
                  this.booster.price.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
