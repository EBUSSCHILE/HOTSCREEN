import 'package:flutter/material.dart';

class AppConstants {
  // Colores principales
  static const Color backgroundColor = Color(0xFF4A0E4E); // Violeta oscuro (fondo principal)
  static const Color darkViolet = Color(0xFF4A0E4E);
  static const Color marengo = Color(0xFF4A4E69);
  static const Color primaryColor = Color(0xFF8E24AA); // Violeta más claro para elementos interactivos
  static const Color secondaryColor = Color(0xFFFFD54F); // Amarillo más suave para acentos
  static const Color accentColor = Color(0xFFFF6E40); // Naranja para elementos de acción

  // Colores de la AppBar
  static const Color appBarBackgroundColor = backgroundColor;
  static const Color appBarTextColor = Colors.white;
  static const Color appBarIconColor = Colors.white;

  // Colores de entrada y configuración
  static const Color inputBackgroundColor = Color(0xFF6A2E72); // Violeta más claro para fondos de entrada
  static const Color inputBorderColor = Color(0xFF8E24AA); // Borde del mismo color que primaryColor
  static const Color inputHintColor = Color(0xFFBDBDBD); // Gris claro para texto de sugerencia
  static const Color settingsItemBackgroundColor = inputBackgroundColor;
  static const Color optionTextColor = Colors.white;

  // Otros colores
  static const Color buttonTextColor = Colors.white;
  static const Color standardTextColor = Colors.white;

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

  static const Color standardBackgroundColor = darkViolet;

  // Añade estas nuevas constantes
  static const Color lightSwitchThumbColor = Colors.white;
  static const Color lightSwitchInactiveThumbColor = Colors.grey;
  static const Color lightInputBackgroundColor = Colors.white;

  // Tamaños de botón
  static const double buttonWidthSmall = 120.0;
  static const double buttonWidthMedium = 160.0;
  static const double buttonWidthLarge = 200.0;

  static const double buttonFontSizeSmall = 14.0;
  static const double buttonFontSizeMedium = 16.0;
  static const double buttonFontSizeLarge = 18.0;
}

class AppColors {
  static const Color buttonColor = AppConstants.darkViolet;
  static const Color buttonTextColor = AppConstants.buttonTextColor;
}
