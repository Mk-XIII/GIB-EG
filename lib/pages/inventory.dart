import 'package:GIB_EG/models/player.dart';
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
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    // Generate 100 widgets that display their index in the List.
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

  //change later into generator function
  List<Container> generateObjects(Map<String, int> items) {
    List<Container> widgets = [];

    items.forEach((k, v) {
      widgets.add(Container(
        color: Color(int.parse(k)),
        child: Text(
          v.toString(),
          style: TextStyle(
            fontSize: 50,
            foreground: Paint()..color = Colors.yellow,
          ),
        ),
      ));
    });

    return widgets;
  }
}
