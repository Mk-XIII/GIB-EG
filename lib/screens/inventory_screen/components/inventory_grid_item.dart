import 'package:GIB_EG/models/Item/item.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Item item;
  final int quanity;
  const GridItem({@required this.item, @required this.quanity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(item.sprite, width: 60, height: 60,),
            Text(item.name),
            Text(quanity.toString()),
          ],
        ),
      ),
    );
  }
}
