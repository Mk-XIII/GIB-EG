// TODO: add missing functionality
import 'package:flutter/material.dart';
import 'dart:math';

abstract class Egg {
  int _durability;//how much clicks an egg must withstand before breaking
  int _clicksToBreak;//clicks before breaking
  int _minCurrencyGain;
  int _bonusCurrencyGain;
  String sprite;//egg sprite name
  double width;
  double height;
  Random _random;
  List<Color> _items;//change to Item class after implementation


  Egg(int _durability, int _clicksToBreak, int _minCurrencyGain, int _bonusCurrencyGain, String sprite, double width, double height)
  {
    this._durability = _durability;
    this._clicksToBreak = _clicksToBreak;
    this._minCurrencyGain = _minCurrencyGain;
    this._bonusCurrencyGain = _bonusCurrencyGain;
    this.sprite = sprite;
    this.width = width;
    this.height = height;
    this._random = Random();
    this._items = [Colors.white, Colors.green, Colors.indigoAccent, Colors.purpleAccent, Colors.orange, Colors.black];
  }

  //returns false when egg breaks
  bool sustainedClick() {
    _clicksToBreak -= 1;

    if(_clicksToBreak == 0) {
      _reset();
      return false;
    } else {
      return true;
    }
  }
  //resets egg to initial state
  void _reset() {
    _clicksToBreak = _durability;
  }

  int dropCurrency() {
    return _minCurrencyGain + _random.nextInt(_bonusCurrencyGain);
  }

  //will need changes when after Item Class implementation
  Color dropItem() {
    //.50 .762625 .887625 .950125 .981345 .996970 basic destribution
    double luckyNumber = _random.nextDouble();
    if(luckyNumber < 0.5) return _items[0];
    if(luckyNumber < 0.762625) return _items[1];
    if(luckyNumber < 0.887625) return _items[2];
    if(luckyNumber < 0.950125) return _items[3];
    if(luckyNumber < 0.981345) return _items[4];
    return _items[5];;
  }
}