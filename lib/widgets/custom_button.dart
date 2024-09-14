import 'package:flutter/material.dart';
import '../styles/button_styles.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final ButtonType tipo;
  final ButtonSize tamano;
  final bool deshabilitado;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.tipo = ButtonType.primary,
    this.tamano = ButtonSize.medium,
    this.deshabilitado = false,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle estilo;
    TextStyle estiloTexto;

    switch (tipo) {
      case ButtonType.secondary:
        estilo = AppButtonStyles.secondaryButton;
        break;
      case ButtonType.primary:
      default:
        estilo = AppButtonStyles.primaryButton;
    }

    if (deshabilitado) {
      estilo = AppButtonStyles.disabledButton;
    }

    switch (tamano) {
      case ButtonSize.gigagiant:
        estiloTexto = AppButtonStyles.gigagiantButtonText;
        break;
      case ButtonSize.tooBig:
        estiloTexto = AppButtonStyles.tooBigButtonText;
        break;
      case ButtonSize.big:
        estiloTexto = AppButtonStyles.bigButtonText;
        break;
      case ButtonSize.medium:
        estiloTexto = AppButtonStyles.mediumButtonText;
        break;
      case ButtonSize.small:
        estiloTexto = AppButtonStyles.smallButtonText;
        break;
      case ButtonSize.micro:
        estiloTexto = AppButtonStyles.microButtonText;
        break;
      case ButtonSize.nano:
        estiloTexto = AppButtonStyles.nanoButtonText;
        break;
      default:
        estiloTexto = AppButtonStyles.mediumButtonText;
    }

    return ElevatedButton(
      style: estilo,
      onPressed: deshabilitado ? null : onPressed,
      child: Text(
        texto,
        style: estiloTexto,
      ),
    );
  }
}

enum ButtonType { primary, secondary }
enum ButtonSize { gigagiant, tooBig, big, medium, small, micro, nano }
