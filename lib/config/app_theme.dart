import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static Color get backgroundColor => AppConstants.backgroundColor;
  static Color get appBarColor => AppConstants.appBarBackgroundColor;
  static Color get primaryColor => AppConstants.primaryColor;
  static Color get textColor => AppConstants.standardTextColor;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.appBarBackgroundColor,
        foregroundColor: AppConstants.standardTextColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppConstants.standardTextColor),
        bodyMedium: TextStyle(color: AppConstants.standardTextColor),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppConstants.inputBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppConstants.inputBorderColor),
        ),
        hintStyle: TextStyle(color: AppConstants.inputHintColor),
      ),
    );
  }
}
