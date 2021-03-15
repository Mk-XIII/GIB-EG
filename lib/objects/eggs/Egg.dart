// TODO: add missing functionality
abstract class Egg {
  int durability;//how much clicks an egg must withstand before breaking
  int clicksToBreak;//clicks before breaking
  int minCurrencyGain;
  int maxCurrencyGain;
  String sprite;//egg sprite name
  double width;
  double height;


  Egg(int durability, int clicksToBreak, int minCurrencyGain, int maxCurrencyGain, String sprite, double width, double height)
  {
    this.durability = durability;
    this.clicksToBreak = clicksToBreak;
    this.minCurrencyGain = minCurrencyGain;
    this.maxCurrencyGain = maxCurrencyGain;
    this.sprite = sprite;
    this.width = width;
    this.height = height;
  }

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