// TODO: add missing functionality
// TODO: add height and width values for different size eggs
abstract class Egg {
  int durability;//how much clicks an egg must withstand before breaking
  int clicksToBreak;//clicks before breaking
  int minCurrencyGain;
  int maxCurrencyGain;
  String sprite;//egg sprite name

  Egg(int durability, int clicksToBreak, int minCurrencyGain, int maxCurrencyGain, String sprite)
  {
    this.durability = durability;
    this.clicksToBreak = clicksToBreak;
    this.minCurrencyGain = minCurrencyGain;
    this.maxCurrencyGain = maxCurrencyGain;
    this.sprite = sprite;
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