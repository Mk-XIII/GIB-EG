// TODO: add missing functionality
// TODO: add height and width values for different size eggs
abstract class Egg {
  int durability;//how much clicks an egg must withstand before breaking
  int clicksToBreak;//clicks before breaking
  String type;//egg sprite name

  //returns false when egg breaks
  bool sustainedClick() {
    clicksToBreak -= 1;

    if(clicksToBreak == 0) {
      _reset();
      return false;
    } else {
      return true;
    }
  }
  //resets egg to initial state
  void _reset() {
    clicksToBreak = durability;
  }
}