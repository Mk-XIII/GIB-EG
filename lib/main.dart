import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GIB_EG/screens/loadingScreen.dart';
import 'package:GIB_EG/Screens/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(),
      '/homeScreen': (contex) => HomeScreen(),
    },
  ));
}
