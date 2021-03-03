import 'Egg.dart';

class BasicEgg extends Egg {
  BasicEgg() {
    durability = 5;
    clicksToBreak = durability;//might do random int generation from 1 to durability for more attracting gameplay
    type = 'basicEgg';
  }
}