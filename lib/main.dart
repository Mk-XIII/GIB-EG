import 'package:flutter/material.dart';
import 'package:GIB_EG/pages/home.dart';
import 'package:GIB_EG/pages/inventory.dart';
import 'package:GIB_EG/pages/loading.dart';
import 'package:GIB_EG/pages/profile.dart';
//TODO: change package name into real one

void main() =>  runApp(MaterialApp(
  initialRoute: '/home',//for testing purposes later will be deleted
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/inventory': (context) => Inventory(),
    '/profile': (context) => Profile(),
  }
));
