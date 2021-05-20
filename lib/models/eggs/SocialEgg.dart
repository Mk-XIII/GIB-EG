import 'package:GIB_EG/models/Item/item.dart';
import 'package:flutter/material.dart';

import 'Egg.dart';

class SocialEgg extends Egg {
  SocialEgg()
      : super(4, 100, 10, 4, 10, 250, 256, [
          Item(
              id: 3,
              name: "Moodle expert",
              sprite: "assets/items/moodle_item.PNG",
              rarity: Colors.green,
              rarityString: "Common",
              description: "Moodle backwards is el doom",
              value: 400),
          Item(
              id: 4,
              name: "Discustang",
              sprite: "assets/items/discustangcolored_item.PNG",
              rarity: Colors.blue,
              rarityString: "Rare",
              description: "Rectang, Triang, Discustang",
              value: 300)
        ], [
          "assets/egs/eggSoc.png",
          "assets/egs/eggSocialLowBreak.png",
          "assets/egs/eggSocialMedBreak.png",
          "assets/egs/eggSocialHighBreak.png",
        ]);
}
