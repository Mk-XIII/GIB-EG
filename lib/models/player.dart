class Player{
  int _money = 0;

  void addMoney(int amount){
    this._money += amount;
  }
  void displayMoney(){
    print(_money);
  }
  int getMoney(){
    return _money;
  }
}