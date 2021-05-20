import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Item.fromDatabase(int id, List<dynamic> values) {
    this.id = id;
    this.name = values[0];
    this.sprite = values[1];
    this.rarityString = values[2];
    this.description = values[3];
    this.value = values[4];
    this.rarity = rarityStringToColor(rarityString);
  }


  void displayItem() {
    print("Info: " + quality + " " + name + " - " + description);
  }

  Color rarityStringToColor(String rarityString){
    switch(rarityString){
      case "Legendary": return Colors.black;
      case "Epic": return Colors.red;
      case "Rare": return Colors.blue;
      case "Common": return Colors.green;
      default: throw new Exception();
    }
  }
}