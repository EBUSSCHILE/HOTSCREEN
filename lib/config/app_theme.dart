import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../styles/app_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppConstants.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppConstants.secondaryColor),
        titleTextStyle: AppStyles.headingMedium,
      ),
      textTheme: const TextTheme(
        displayLarge: AppStyles.headingLarge,
        displayMedium: AppStyles.headingMedium,
        bodyLarge: AppStyles.bodyLarge,
        bodyMedium: AppStyles.bodyMedium,
        bodySmall: AppStyles.bodySmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.primaryButtonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: AppStyles.secondaryButtonStyle,
      ),
      // Otros ajustes del tema...
    );
  }

  static ThemeData get darkTheme {
    // Por ahora, usaremos el mismo tema que el claro
    // En el futuro, puedes personalizar esto para un tema oscuro específico
    return lightTheme;
  }
}
