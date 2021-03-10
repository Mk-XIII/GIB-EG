import 'package:flutter/material.dart';
import 'package:GIB_EG/screens/loadingScreen.dart';
import 'package:GIB_EG/Screens/homeScreen.dart';

void main() =>  runApp(MaterialApp(
  routes: {
    '/': (context) => Loading(),
    '/homeScreen': (contex) => HomeScreen(),
  },
));