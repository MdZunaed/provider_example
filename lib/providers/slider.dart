import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double value = 0.0;

  get currentValue => value;

  void setValue(double newValue) {
    value = newValue;
    notifyListeners();
  }
}
