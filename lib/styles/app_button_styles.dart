import 'package:flutter/material.dart';

class AppButtonStyles {
  // Colores personalizados
  static const Color primaryColor = Color(0xFF4B0082); // Violeta oscuro
  static const Color secondaryColor = Color(0xFF9370DB); // Violeta medio
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

  // Nuevo estilo de texto para botones generales
  static const TextStyle estiloTexto = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    letterSpacing: 1.0, // Espaciado por defecto
    // Puedes agregar más propiedades según tus necesidades
  );

  // Estilos de botones
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: primaryColor, // Color violeta oscuro
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: secondaryColor, // Violeta medio
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

  // Método responsivo para estilos de botones
  static ButtonStyle getResponsiveButtonStyle(BuildContext context,
      {required ButtonSize size}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = screenWidth > screenHeight;

    // Ajustamos los cálculos para hacer los cambios más notables
    double buttonWidth = isLandscape
        ? screenWidth * 0.4 // 40% del ancho en modo paisaje
        : screenWidth * 0.7; // 70% del ancho en modo retrato

    // Calculamos la altura del botón basada en el tamaño de la pantalla
    double baseHeight = screenHeight * 0.06; // 6% de la altura de la pantalla
    double buttonHeight = baseHeight * _getSizeMultiplier(size);

    return ElevatedButton.styleFrom(
      minimumSize: Size(buttonWidth, buttonHeight),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      backgroundColor: primaryColor, // Aseguramos el color violeta oscuro
    );
  }

  static double _getSizeMultiplier(ButtonSize size) {
    switch (size) {
      case ButtonSize.gigagiant:
        return 1.5;
      case ButtonSize.tooBig:
        return 1.3;
      case ButtonSize.big:
        return 1.2;
      case ButtonSize.medium:
        return 1.0;
      case ButtonSize.small:
        return 0.9;
      case ButtonSize.micro:
        return 0.8;
      case ButtonSize.nano:
        return 0.7;
    }
  }
}

// Definición única de la enumeración ButtonSize
enum ButtonSize {
  gigagiant,
  tooBig,
  big,
  medium,
  small,
  micro,
  nano,
}