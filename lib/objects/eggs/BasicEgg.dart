import 'Egg.dart';
import 'dart:ui' as UI;

class BasicEgg extends Egg {
  BasicEgg(UI.Image image) : super(5, 5, 1, 3, 'assets/sprites/egg.png', image);
}
