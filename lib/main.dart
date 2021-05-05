import 'package:GIB_EG/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GIB_EG/screens/loadingScreen.dart';
import 'package:GIB_EG/Screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'models/player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //UI
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  //Probably not the right place to put but this widget allows all child widgets to access provided object state
  runApp(ChangeNotifierProvider<Player>(
    create: (_) => Player(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => WelcomeScreen(),
        '/loading': (context) => Loading(),
        '/homeScreen': (contex) => HomeScreen(),
      },
    ),
  ));
}
