import 'dart:async';

import 'package:GIB_EG/models/Item/item.dart';
import 'package:GIB_EG/models/eggs/BasicEgg.dart';
import 'package:GIB_EG/models/eggs/FancyEgg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'booster.dart';
import 'eggs/Egg.dart';

class Player extends ChangeNotifier{
  int _money = 0;
  bool _isBoosterActive = false;
  Map<Item, int> _items;//change to right types after item class implementation
  Map<Booster, int> _boosters; //boosters that are currently in use
  List<Egg> _egs; //egs that are bought

  Player() {
    _items = Map();
    _boosters = Map();
    //for now this is hardcoded
    _egs = [BasicEgg(), FancyEgg()];
  }

  bool isBoosterActive(){
    return _isBoosterActive;
  }
  void addMoney(int amount){
    this._money += amount;
    notifyListeners();
  }
  bool substractMoney(int amount){
    if(this._money - amount >= 0){
      this._money -= amount;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
  // void addEg(Egg eg){
  //   _egs.add(eg);
  //   notifyListeners();
  // }
  
  List<Egg> getEgs(){
    return _egs;
  }

  int getMoney(){
    return _money;
  }

  Color addItem(Item item) {
    bool added = false;
    _items.forEach((key, value) {
      if(key.id == item.id){
        _items[key] += 1;
        added = true;
        //return item.name == "test1" ? Colors.blue : item.name == "test2" ? Colors.red : item.name == "test3" ? Colors.green : Colors.black; 
      } 
    });
    if(!added){
      _items[item] = 1;
    }
    return item.name == "Discustang" ? Colors.blue : item.name == "34D Printer" ? Colors.red : item.name == "Moodle expert" ? Colors.green : Colors.black; 
  }

  Map<Item, int> getItems() {
    return _items;
  }
  void addBooster(Booster booster){
    _boosters.putIfAbsent(booster, () => 0);
    _boosters.update(booster, (value) => value + 1);
    _isBoosterActive = true;
    _startBoosterEffect(booster);
    notifyListeners();
  }
  //placeholder function
  void _startBoosterEffect(Booster booster){
    _egs[0].changeProperties(1000, 10000);
    Future.delayed(const Duration(seconds: 10), () {
      _egs[0] = BasicEgg();
      _isBoosterActive = false;
      notifyListeners();
    });
  }
}