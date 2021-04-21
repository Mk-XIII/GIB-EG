import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:flutter/widgets.dart';

class Booster {
  String name;
  String description;
  int price;
  IconData icon;
  String sprite;

  Booster(String name, String description, int price, IconData icon) {
    this.name = name;
    this.description = description;
    this.price = price;
    this.icon = icon;
  }
}

final List<Booster> boosters = [
  Booster("Whetstone", "+% to get a better quality item", 100, EgCons.profile),
  Booster("Yellow spray can", "+% to sold item value", 200, EgCons.achievement),
  Booster("Magnifying glass", "+% to get a better item", 300, EgCons.currency),
  Booster("Broken mirror", "+% to get two items instead of one", 400, EgCons.champion_cup),
  Booster("Golden feather", "Clicking eg generates gold", 500, EgCons.settings),
];
