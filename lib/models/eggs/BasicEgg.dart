import 'package:GIB_EG/models/Item/item.dart';

import 'Egg.dart';

class BasicEgg extends Egg {
  BasicEgg()
      : super(0, 1, 1, 50, 59, 'assets/sprites/egg.png', 250, 341, [
          Item(
              id: 1, name: "The Letter 'A'", sprite: "assets/items/a_item.PNG"),
          Item(
              id: 2, name: "34D Printer", sprite: "assets/items/printer.PNG")
        ]);
}
