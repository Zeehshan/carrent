

import 'package:flutter/material.dart';

class LngChange extends ChangeNotifier{
  int currentIndex = 0;
  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}