import 'dart:ffi';

class Item {
  String name;
  String description;
  String sprite;
  String rarity;
  String quality;
  int value;

  Item(String name, String description, String sprite, String rarity,
      String quality, int value) {
    this.name = name;
    this.description = description;
    this.sprite = sprite;
    this.rarity = rarity;
    this.quality = quality;
    this.value = value;
  }

  void displayItem() {
    print("Info: " + quality + " " + name + " - " + description);
  }
}
