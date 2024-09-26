import 'package:flutter/material.dart';
import '../styles/button_styles.dart'; // Asegúrate de que esta importación esté presente

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final ButtonType tipo;
  final ButtonSize tamano;
  final bool deshabilitado;
  final double? widthFactor;

  const CustomButton({
    super.key, // Uso de parámetros super
    required this.texto,
    required this.onPressed,
    this.tipo = ButtonType.primary,
    this.tamano = ButtonSize.medium,
    this.deshabilitado = false,
    this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double calculatedWidthFactor;

    if (mediaQuery.size.width > 1200) { // Pantallas extremadamente grandes
      calculatedWidthFactor = 0.3;
    } else if (mediaQuery.size.width > 900) { // Pantallas grandes (tablets, laptops)
      calculatedWidthFactor = 0.4;
    } else if (mediaQuery.size.width > 600) { // Pantallas medianas
      calculatedWidthFactor = 0.5;
    } else if (mediaQuery.orientation == Orientation.landscape) {
      calculatedWidthFactor = 0.6;
    } else {
      calculatedWidthFactor = widthFactor ?? 0.8; // Valor por defecto para pantallas pequeñas
    }

    double buttonWidth = mediaQuery.size.width * calculatedWidthFactor;

    // Cálculo dinámico de letterSpacing basado en el ancho del botón
    double letterSpacing = buttonWidth > 300 ? 2.0 : 1.0;

    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: deshabilitado ? null : onPressed,
        style: AppButtonStyles.getResponsiveButtonStyle(context, size: tamano),
        child: Text(
          texto,
          style: AppButtonStyles.estiloTexto.copyWith(
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary }
