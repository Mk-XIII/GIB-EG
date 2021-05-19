// TODO: add missing functionality
import 'package:GIB_EG/models/Item/item.dart';
import 'dart:math';

abstract class Egg {
  int _id;
  int _durability;//how much clicks an egg must withstand before breaking
  int _clicksToBreak;//clicks before breaking
  int _minCurrencyGain;
  int _bonusCurrencyGain;
  String sprite;//egg sprite name
  double width;
  double height;
  Random _random;
  List<Item> _droppableItems;//change to Item class after implementation


  Egg(int id, int durability, int clicksToBreak, int minCurrencyGain, int bonusCurrencyGain, String sprite, double width, double height, List<Item> droppableItems)
  {
    this._id = id;
    this._durability = durability;
    this._clicksToBreak = clicksToBreak;
    this._minCurrencyGain = minCurrencyGain;
    this._bonusCurrencyGain = bonusCurrencyGain;
    this.sprite = sprite;
    this.width = width;
    this.height = height;
    this._random = Random();
    this._droppableItems = droppableItems;
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
  Item dropItem() {
    //.50 .762625 .887625 .950125 .981345 .996970 basic destribution
    double luckyNumber = _random.nextDouble();
    if(luckyNumber < 0.5) return _droppableItems[0];
    // if(luckyNumber < 0.762625) return _droppableItems[1];
    // if(luckyNumber < 0.887625) return _droppableItems[2];
    // if(luckyNumber < 0.950125) return _droppableItems[3];
    // if(luckyNumber < 0.981345) return _droppableItems[4];
    return _droppableItems[1];
  }
  //temporary function to represent that boosters work
  void changeProperties(int x, int y){
    this._minCurrencyGain = x;
    this._bonusCurrencyGain = y;
  }
}