import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ThemeProvider extends ChangeNotifier {
  Color _backgroundColor = AppConstants.darkViolet;
  bool _isDarkMode = false;

  Color get backgroundColor => _backgroundColor;
  bool get isDarkMode => _isDarkMode;

  void setBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _backgroundColor = _isDarkMode ? Colors.black : AppConstants.darkViolet;
    notifyListeners();
  }
}
