import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';

class ShopItem extends StatelessWidget {
  final String price;
  final String itemName;
  final IconData icon;

  const ShopItem(
      {@required this.itemName, @required this.price, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              content: Text("Hello world!")
            );
          }
        );
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.itemName,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 7),
            Icon(this.icon, size: 50, color: Colors.white),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(EgCons.currency,
                    size: 20, color: Color.fromRGBO(255, 231, 231, 100)),
                Text(
                  this.price,
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
