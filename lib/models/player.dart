class Player{
  int _money = 0;
  Map<String, int> _items;//change to right types after item class implementation

  Player() {
    _items = Map();
  }

  void addMoney(int amount){
    this._money += amount;
  }
  void displayMoney(){
    print(_money);
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
}