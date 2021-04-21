import 'dart:async';

import 'package:GIB_EG/models/eggs/BasicEgg.dart';
import 'package:GIB_EG/models/eggs/FancyEgg.dart';
import 'package:flutter/cupertino.dart';

import 'booster.dart';
import 'eggs/Egg.dart';

class Player extends ChangeNotifier{
  int _money = 0;
  Map<String, int> _items;//change to right types after item class implementation
  Map<Booster, int> _boosters;
  List<Egg> _egs;

  Player() {
    _items = Map();
    _boosters = Map();
    _egs = [BasicEgg(), FancyEgg()];
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

  void addItem(String key) {
    _items.putIfAbsent(key, () => 0);
    _items.update(key, (value) => value + 1);
  }

  Map<String, int> getItems() {
    return _items;
  }
  void addBooster(Booster booster){
    _boosters.putIfAbsent(booster, () => 0);
    _boosters.update(booster, (value) => value + 1);
    _startBoosterEffect(booster);
    notifyListeners();
  }
  void _startBoosterEffect(Booster booster){
    _egs[0].changeProperties(1000, 10000);
    Future.delayed(const Duration(seconds: 60), () {
      _egs[0] = BasicEgg();
    });
  }
}