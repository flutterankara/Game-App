import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/product/models/user/user_model.dart';

class GeneralProvider extends ChangeNotifier {
  int _currentScore = 0;
  int get currentScore => _currentScore;
  set currentScore(int value) {
    _currentScore = value;
    notifyListeners();
  }

  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

  AudioPlayer audioPlayer = AudioPlayer();
}
