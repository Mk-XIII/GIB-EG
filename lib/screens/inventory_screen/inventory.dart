import 'package:GIB_EG/models/Item/item.dart';
import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/screens/inventory_screen/components/inventory_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Inventory extends StatefulWidget {
  //number of filtarable object items, eggs, boosters etc.
  final sections = 1;

  const Inventory();

  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  final textController = TextEditingController();
  int _currentIndex = 0;


  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sprites/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                      splashRadius: 15,
                      icon: Icon(Icons.keyboard_arrow_left_rounded),
                      iconSize: 35.0,
                      onPressed: () {
                        _currentIndex = (_currentIndex - 1) % widget.sections;
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 19.0),
                      child: SizedBox.expand(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 4,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 8.0, 16.0),
                                    //highlightColor: Colors.transparent,
                                    //splashColor: Colors.transparent,
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: TextField(
                                    controller: textController,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    padding: EdgeInsets.fromLTRB(
                                        8.0, 0.0, 0.0, 16.0),
                                    //highlightColor: Colors.transparent,
                                    //splashColor: Colors.transparent,
                                    icon: Icon(Icons.search),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                      splashRadius: 15,
                      icon: Icon(Icons.keyboard_arrow_right_rounded),
                      iconSize: 35.0,
                      onPressed: () {
                        _currentIndex = (_currentIndex + 1) % widget.sections;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<Player>(
                  builder: (context, player, child) => GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: generateObjects(player.getItems()),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(width: double.infinity, height: 8.0),
            ),
          ],
        ),
      ),
    );
  }

  //function that populates grid with items that matches search phrase
  List<GridItem> generateObjects(Map<Item, int> items) {
    List<GridItem> widgets = [];
    RegExp searchPhrase = new RegExp(textController.text.replaceAll(RegExp(r"\\"), ""),
      caseSensitive: false,
      multiLine: false, );

    items.forEach((key, value) {
      if(searchPhrase.hasMatch(key.name)) {
        widgets.add(GridItem(item: key, quanity: value));
      }
    });
    return widgets;
  }
}
