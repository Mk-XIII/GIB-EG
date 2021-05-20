import 'package:GIB_EG/models/Item/item.dart';
import 'package:GIB_EG/models/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryItemPopup extends StatelessWidget {
  final Item item;

  const InventoryItemPopup({@required this.item});

  @override
  Widget build(BuildContext context) {
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
              item.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                var player = Provider.of<Player>(context, listen: false);
                player.addMoney(item.value);
                player.removeItem(item);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                padding: const EdgeInsets.all(15),
                child: Text(
                  "SELL",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
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
  }
}
