import 'dart:ffi';

class Item {
  String name;
  String description;
  String sprite;
  String rarity;
  String quality;
  int value;

  void displayItem() {
    print("Info: " + quality + " " + name + " - " + description);
  }
}
