class Item {
  int id;
  String name;
  String description;
  String sprite;
  String rarity;
  String quality;
  int value;

  Item({this.id, this.name, this.description, this.sprite, this.rarity, this.quality, this.value});

  Item.fromDatabase(int id, List<dynamic> values) {
    this.id = id;
    this.name = values[0];
    this.sprite = values[1];
  }

  void displayItem() {
    print("Info: " + quality + " " + name + " - " + description);
  }
}