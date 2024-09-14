import 'package:flutter/material.dart';

class AppButtonStyles {
  // Colores personalizados
  static const Color primaryColor = Color(0xFF1A237E);
  static const Color secondaryColor = Color(0xFF4A148C);
  static const Color accentColor = Color(0xFFE1BEE7);
  static const Color disabledColor = Colors.grey;

  // Tamaños
  static const double gigagiant = 22.0;
  static const double tooBig = 20.0;
  static const double big = 18.0;
  static const double medium = 16.0;
  static const double small = 14.0;
  static const double micro = 12.0;
  static const double nano = 10.0;

  // Estilos de texto para botones
  static const TextStyle gigagiantButtonText = TextStyle(
    fontSize: gigagiant,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle tooBigButtonText = TextStyle(
    fontSize: tooBig,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle bigButtonText = TextStyle(
    fontSize: big,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle mediumButtonText = TextStyle(
    fontSize: medium,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle smallButtonText = TextStyle(
    fontSize: small,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle microButtonText = TextStyle(
    fontSize: micro,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle nanoButtonText = TextStyle(
    fontSize: nano,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  // Estilos de botones
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: secondaryColor,
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  );

  static ButtonStyle disabledButton = ElevatedButton.styleFrom(
    backgroundColor: disabledColor,
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  );
}
