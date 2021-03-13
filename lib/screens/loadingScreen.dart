import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void changePage(String route) async {
    UI.Image currencyImage = await loadUiImage('assets/icons/currencySmall.png');
    UI.Image basicEggImage = await loadUiImage('assets/sprites/egg.png');
    UI.Image fancyEggImage = await loadUiImage('assets/sprites/fancy_egg.png');

    Navigator.pushReplacementNamed(context, route, arguments: {
      'currencyImage': currencyImage,
      'basicEggImage': basicEggImage,
      'fancyEggImage': fancyEggImage,
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
