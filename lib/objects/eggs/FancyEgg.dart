import 'Egg.dart';

class FancyEgg extends Egg {
  FancyEgg() {
    durability = 10;
    clicksToBreak = durability;//might do random int generation from 1 to durability for more attracting gameplay
    sprite = 'assets/sprites/fancy_egg.png';
  }
}