import 'package:flutter/material.dart';

/// There are two screens for now, for main screen, one displaying periodic table in standard format
/// and other displaying elements in list.
/// This class handles the state of these screens.
class HomeScreenState with ChangeNotifier {
  int index = 0;

  void changeToFirst() {
    index = 0;
    notifyListeners();
  }

  void changeToSecond() {
    index = 1;
    notifyListeners();
  }
}
