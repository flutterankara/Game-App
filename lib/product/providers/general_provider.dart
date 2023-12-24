import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  int _currentScore = 0;
  int get currentScore => _currentScore;
  set currentScore(int value) {
    _currentScore = value;
    notifyListeners();
  }
  
}
