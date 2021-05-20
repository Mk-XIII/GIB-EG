import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/utilities/authentication_services.dart';
import 'package:GIB_EG/utilities/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    changePage('/homeScreen');
  }

  //probably possible to optimize with parallelization
  void changePage(String route) async {
    DatabaseService db = Provider.of<DatabaseService>(context, listen: false);
    String uid = context.read<AuthenticationService>().getUserId();
    Provider.of<Player>(context, listen: false).populate(await db.getUserData(uid), await db.getItemData());

    UI.Image currencyImage = await loadUiImage('assets/icons/currencySmall.png');   

    Navigator.pushReplacementNamed(context, route, arguments: {
      'currencyImage': currencyImage,
    });
  }

  Future<UI.Image> loadUiImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final Completer<UI.Image> completer = Completer();
    UI.decodeImageFromList(Uint8List.view(data.buffer), (UI.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
