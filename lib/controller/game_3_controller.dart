import 'package:flutter/material.dart';

class Game3Controller extends ChangeNotifier {
  final ScrollController _sc = ScrollController();

  double _position = 0;

  double get position => _position;

  ScrollController get sc => _sc;
  void getPosition() {
    _position = _sc.position.pixels / 100 - 3;
    notifyListeners();
  }
}
