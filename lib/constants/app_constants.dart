import 'package:flutter/material.dart';

class AppConstants {
  // Colores principales
  static const Color backgroundColor = Color(0xFF000080); // Azul oscuro
  static const Color darkViolet = Color(0xFF4A148C);
  static const Color marengo = Color(0xFF4A4E69);
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.white;
  static const Color accentColor = Colors.orange;

  // Colores de la AppBar
  static const Color appBarBackgroundColor = Color(0xFF4A148C); // Violeta oscuro
  static const Color appBarTextColor = Colors.white;
  static const Color appBarIconColor = Colors.white;

  // Colores de entrada
  static const Color inputBackgroundColor = secondaryColor;
  static const Color inputBorderColor = Color(0xFFE0E0E0);

  // Tamaños
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;

  // Duraciones de animación
  static const Duration animationDurationShort = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 500);
  static const Duration animationDurationLong = Duration(milliseconds: 1000);

  // Colores de botones
  static const Color buttonTextColor = Colors.white;

  // Añadimos esta línea
  static const Color optionTextColor = secondaryColor;

  static const Color standardBackgroundColor = darkViolet;

  // Nuevo color estándar para textos
  static const Color standardTextColor = Colors.white;
}

class AppColors {
  static const Color buttonColor = AppConstants.darkViolet;
  static const Color buttonTextColor = AppConstants.buttonTextColor;
}
