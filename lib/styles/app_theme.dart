import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: AppConstants.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.appBarBackgroundColor,
        foregroundColor: AppConstants.appBarTextColor,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppConstants.standardTextColor),
        bodyMedium: TextStyle(color: AppConstants.standardTextColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryColor,
          foregroundColor: AppConstants.buttonTextColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppConstants.inputBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          borderSide: const BorderSide(color: AppConstants.inputBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          borderSide: const BorderSide(color: AppConstants.inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          borderSide: const BorderSide(color: AppConstants.primaryColor, width: 2),
        ),
        hintStyle: const TextStyle(color: AppConstants.inputHintColor),
      ),
    );
  }

  // Puedes agregar un tema oscuro aquí si lo necesitas en el futuro
  static ThemeData get darkTheme {
    // Implementar tema oscuro
    return ThemeData.dark().copyWith(
      // Personalizar el tema oscuro aquí
    );
  }
}