import 'package:GIB_EG/models/Item/item.dart';
import 'package:flutter/material.dart';

import 'Egg.dart';

class BasicEgg extends Egg {
  BasicEgg()
      : super(0, 1, 10, 50, 59, 250, 341, [
          Item(
              id: 1,
              name: "The Letter 'A'",
              sprite: "assets/items/a_item.PNG",
              description: "A substitute for spaces, according to experts",
              value: 100,
              rarity: Colors.black,
              rarityString: "Legendary"),
          Item(
              id: 2,
              name: "34D Printer",
              sprite: "assets/items/printer.PNG",
              description: "Print me like one of your 15min wives",
              value: 200,
              rarity: Colors.red,
              rarityString: "Epic")
        ], [
          "assets/egs/egg.png",
          "assets/egs/eggLowBreak.png",
          "assets/egs/eggMedBreak.png",
          "assets/egs/eggHighBreak.png"
        ]);
}
