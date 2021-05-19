import 'package:GIB_EG/models/Item/item.dart';

import 'Egg.dart';

class FancyEgg extends Egg {
  FancyEgg() : super(1, 1, 1, 4, 10, 'assets/sprites/fancy_egg.png', 250, 256, [Item(id: 3, name: "Moodle expert", sprite: "assets/items/moodle_item.PNG"), Item(id: 4, name: "Discustang", sprite: "assets/items/discustangcolored_item.PNG")]);
}