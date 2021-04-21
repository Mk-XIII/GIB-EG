class Item {
  int id;
  String name;
  String description;
  String sprite;
  String rarity;
  String quality;
  int value;

  Item({this.id, this.name, this.description, this.sprite, this.rarity, this.quality, this.value});

  void displayItem() {
    print("Info: " + quality + " " + name + " - " + description);
  }
}