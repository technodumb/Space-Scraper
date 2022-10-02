import 'package:flutter/material.dart';

class Game3Controller extends ChangeNotifier {
  final List<ScrollController> _sc = [
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
  ];
  double _position = 0;

  double get position => _position;

  List<ScrollController> get sc => _sc;
  void getPosition(int pg) {
    _position = _sc[pg].position.pixels / 100 - 3;
    notifyListeners();
  }

  int _score = 0;
  int get score => _score;
  void incrementScore() {
    _score++;
    notifyListeners();
  }
}
