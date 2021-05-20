import 'package:GIB_EG/models/Item/item.dart';
import 'package:GIB_EG/screens/inventory_screen/components/inventory_item_popup.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Item item;
  final int quanity;
  const GridItem({@required this.item, @required this.quanity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return InventoryItemPopup(
                item: this.item,
              );
            });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: this.item.rarity, width: 5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                item.sprite,
                width: 100,
                height: 100,
              ),
              Text(item.name),
              Text(quanity.toString()),
              SizedBox(height: 10,),
              Text("Rarity: " + item.rarityString),
            ],
          ),
        ),
      ),
    );
  }
}
