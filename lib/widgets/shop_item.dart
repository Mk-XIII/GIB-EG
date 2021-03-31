import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';

class ShopItem extends StatelessWidget {
  final String price;
  final String itemName;
  final IconData icon;
  final String description;

  const ShopItem(
      {@required this.itemName,
      @required this.price,
      @required this.icon,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.all(2.0),
                content: Container(
                  padding: const EdgeInsets.all(30),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        this.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30, ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green,),
                        padding: const EdgeInsets.all(15),                        
                        child: Text("BUY", style: TextStyle(color: Colors.white, fontSize: 30),),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/sprites/background.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              child: Text(
                this.itemName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
