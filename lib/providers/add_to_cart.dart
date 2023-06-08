import 'package:flutter/material.dart';

class AddCartProvider with ChangeNotifier {
  final List<int> _cartItem = [];

  List<int> get cartItem => _cartItem;

  void addItem(int value) {
    _cartItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _cartItem.remove(value);
    notifyListeners();
  }
}
