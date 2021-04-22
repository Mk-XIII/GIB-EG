import 'dart:convert';

import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:flutter/widgets.dart';

class Booster {
  String name;
  String description;
  int price;
  String sprite;

  Booster(this.name, this.description, this.price, this.sprite);

  Booster.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        price = json['price'],
        sprite = json['sprite'];
}

final List<Booster> boosters = [


  Booster("Whetstone", "+% to get a better quality item", 100, "assets/boosters/whetstone.png"),
  Booster("Yellow spray can", "+% to sold item value", 200, "assets/boosters/spray_booster.png"),
  Booster("Magnifying glass", "+% to get a better item", 300, "assets/boosters/magnifying_glass.png"),
  Booster("Broken mirror", "+% to get two items instead of one", 400,
      "assets/boosters/mirror_booster.png"),
  Booster("Golden feather", "Clicking eg generates gold", 500, "assets/boosters/feather.png"),
];
