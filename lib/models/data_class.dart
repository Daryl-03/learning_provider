import 'package:flutter/material.dart';

class DataClass extends ChangeNotifier {
  int _productCount = 0;
  int get productCount => _productCount;
  void incrementProductCount() {
    _productCount++;
    notifyListeners();
  }
  void decrementProductCount() {
    _productCount--;
    notifyListeners();
  }
}