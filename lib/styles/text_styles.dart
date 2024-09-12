import 'package:flutter/material.dart';

class AppTextStyles {
  // Colores personalizados
  static const Color darkBlue = Color(0xFF1A237E);
  static const Color deepPurple = Color(0xFF4A148C);
  static const Color mediumPurple = Color(0xFF7B1FA2);
  static const Color lightAccent = Color(0xFFE1BEE7);
  static const Color offWhite = Color(0xFFF5F5F5);

  static const TextStyle gigagiant = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: darkBlue,
  );

  static const TextStyle tooBig = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: darkBlue,
  );

  static const TextStyle big = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: darkBlue,
  );

  static const TextStyle medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: deepPurple,
  );

  static const TextStyle small = TextStyle(
    fontSize: 14,
    color: mediumPurple,
  );

  static const TextStyle micro = TextStyle(
    fontSize: 12,
    color: mediumPurple,
  );

  static const TextStyle microMicro = TextStyle(
    fontSize: 10,
    color: Colors.grey,
  );

  static const TextStyle nano = TextStyle(
    fontSize: 8,
    color: Colors.grey,
  );

  // Estilos específicos para campos de texto
  static const TextStyle inputText = TextStyle(
    fontSize: 14,
    color: darkBlue,
  );

  static const TextStyle hintText = TextStyle(
    fontSize: 14,
    color: mediumPurple,
  );

  // Estilos para fondos claros
  static const TextStyle lightBgText = TextStyle(
    fontSize: 14,
    color: deepPurple,
  );

  // Estilos para fondos oscuros
  static const TextStyle darkBgText = TextStyle(
    fontSize: 14,
    color: offWhite,
  );

  // Estilo para texto muy pequeño en fondos oscuros
  static const TextStyle microDarkBg = TextStyle(
    fontSize: 12,
    color: lightAccent,
  );

  // Estilo para texto muy pequeño en fondos claros
  static const TextStyle microLightBg = TextStyle(
    fontSize: 12,
    color: mediumPurple,
  );
}
