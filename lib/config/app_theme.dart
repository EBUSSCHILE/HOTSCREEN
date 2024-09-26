import 'package:flutter/material.dart';
import '../styles/text_styles.dart';
// Eliminamos la siguiente línea:
// import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  // Definimos el color de fondo azul oscuro
  static const Color backgroundColor = Color(0xFF000080); // Este es el azul oscuro de la imagen

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.tooBig,
        displayMedium: AppTextStyles.big,
        bodyLarge: AppTextStyles.medium,
        bodyMedium: AppTextStyles.small,
        bodySmall: AppTextStyles.micro,
      ),
      // Otros ajustes del tema...
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor, // Usamos el mismo color para el tema oscuro
      // Otros ajustes del tema oscuro...
    );
  }
}
