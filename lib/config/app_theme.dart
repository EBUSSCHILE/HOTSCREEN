import 'package:flutter/material.dart';
// Eliminamos la siguiente línea:
// import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6C3EE8);
  static const Color secondaryColor = Color(0xFF9D7BF2);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Colors.white;

  static const String backgroundImage = "assets/images/background.png";

  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: textColor, fontSize: 16),
        bodyMedium: TextStyle(color: textColor, fontSize: 14),
      ),
    );
  }

  static BoxDecoration get pageBackground {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(backgroundImage),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Color(0xAA6C3EE8),
          BlendMode.srcOver,
        ),
      ),
    );
  }
}
