import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/inventory.dart';
import 'package:flutter_application_1/pages/loading.dart';
import 'package:flutter_application_1/pages/profile.dart';
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
