import 'Egg.dart';
import 'dart:ui' as UI;

class FancyEgg extends Egg {
  FancyEgg(UI.Image image) : super(10, 10, 4, 10, 'assets/sprites/fancy_egg.png', image);
}