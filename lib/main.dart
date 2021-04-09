import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GIB_EG/screens/loadingScreen.dart';
import 'package:GIB_EG/Screens/homeScreen.dart';
import 'package:provider/provider.dart';

import 'models/player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  runApp(ChangeNotifierProvider<Player>(
    create: (_) => Player(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Loading(),
        '/homeScreen': (contex) => HomeScreen(),
      },
    ),
  ));
}
