import 'package:flutter/material.dart';

class PieceController extends ChangeNotifier {
  final List<bool> _pieces = List.generate(7, (index) => false);

  int get piecesLeft => _pieces.where((element) => element == false).length;
  List<bool> get pieceStatus => _pieces;
  void achievePiece(int pno) {
    _pieces[pno] = true;
    notifyListeners();
  }
}
