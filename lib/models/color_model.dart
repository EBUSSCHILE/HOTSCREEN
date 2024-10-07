import 'package:flutter/material.dart';

class ColorModel extends ChangeNotifier {
  Color _backgroundColor = Colors.purple;

  Color get backgroundColor => _backgroundColor;

  void setBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }
}