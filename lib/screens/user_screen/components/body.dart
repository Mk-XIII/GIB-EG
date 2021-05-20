import 'dart:ffi';

import 'package:GIB_EG/components/background.dart';
import 'package:GIB_EG/components/screen_header.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:GIB_EG/screens/user_screen/components/user_tile.dart';
import 'package:GIB_EG/utilities/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<DatabaseService>(context, listen: false).getInstance();
    return Background(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            ScreenHeader(screenName: "ALL USERS", screenIcon: EgCons.profile),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            StreamBuilder<QuerySnapshot>(
                stream: db.collection("users").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text("There is no expense");
                  return new Column(children: createUserTiles(snapshot)); 
                }),
          ],
        ),
      ),
    );
  }
}

List<UserTile> createUserTiles(AsyncSnapshot<QuerySnapshot<Object>> snapshot) {
  List<UserTile> tiles = [];
  snapshot.data.docs.asMap().forEach((key, value) {
    tiles.add(UserTile(username: value.get("Username")));
  });
  return tiles;
}
