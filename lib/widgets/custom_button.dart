import 'package:flutter/material.dart';
import '../styles/app_colors.dart';  // Asumiendo que tienes un archivo de colores

enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final ButtonSize buttonWidth;
  final bool disabled;

  const CustomButton({
    super.key, // Usamos super.key en lugar de Key? key
    required this.texto,
    required this.onPressed,
    this.buttonWidth = ButtonSize.medium,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: _getPadding(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.buttonTextColor,
        disabledBackgroundColor: AppColors.disabledColor,
        disabledForegroundColor: AppColors.disabledTextColor,
      ),
      child: SizedBox(
        width: _getWidth(context),
        child: Center(
          child: Text(
            texto,
            style: _getTextStyle(context),
          ),
        ),
      ),
    );
  }

  double _getWidth(BuildContext context) {
    switch (buttonWidth) {
      case ButtonSize.small:
        return MediaQuery.of(context).size.width * 0.3;
      case ButtonSize.medium:
        return MediaQuery.of(context).size.width * 0.5;
      case ButtonSize.large:
        return MediaQuery.of(context).size.width * 0.7;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (buttonWidth) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 24);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 32);
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    switch (buttonWidth) {
      case ButtonSize.small:
        return textTheme.labelSmall ?? const TextStyle();
      case ButtonSize.medium:
        return textTheme.labelMedium ?? const TextStyle();
      case ButtonSize.large:
        return textTheme.labelLarge ?? const TextStyle();
    }
  }
}
