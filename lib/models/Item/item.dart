import 'package:flutter/cupertino.dart';

class Item {
  int id;
  String name;
  String description;
  String sprite;
  Color rarity;
  String rarityString;
  String quality;
  int value;

  Item({this.id, this.name, this.description, this.sprite, this.rarity, this.quality, this.value, this.rarityString});

  void displayItem() {
    print("Info: " + quality + " " + name + " - " + description);
  }
}