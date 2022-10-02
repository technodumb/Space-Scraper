import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game1Controller extends ChangeNotifier {
  bool _check = false;
  int _score = 0;
  List<bool> _pieces = List.generate(7, (index) => false);

  List<String> webbpaths =
      List.generate(4, (index) => 'assets/images/webb/webb${index + 1}.jpg');

  List<String> hubpaths =
      List.generate(4, (index) => 'assets/images/hubble/hub${index + 1}.jpg');

  // create getter and setter for check
  bool get check => _check;
  // create a function that toggles _check
  void toggleCheck() {
    _check = !_check;
    notifyListeners();
  }

  // create getter and incrementer for score
  int get score => _score;
  void incrementScore() {
    _score++;
    notifyListeners();
  }

  int get piecesLeft => _pieces.where((element) => element == false).length;
  List<bool> get pieceStatus => _pieces;
  void achievePiece(int pno) {
    _pieces[pno] = true;
    notifyListeners();
  }
}
