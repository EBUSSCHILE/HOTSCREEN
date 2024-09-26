import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  final Color _primaryColor = Colors.purple;
  final Color _scaffoldBackgroundColor = const Color(0xFF000080); // Azul oscuro
  bool _useVariableBackground = false;

  ThemeData get theme => ThemeData(
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );

  bool get useVariableBackground => _useVariableBackground;

  void toggleBackground() {
    _useVariableBackground = !_useVariableBackground;
    notifyListeners();
  }
}
