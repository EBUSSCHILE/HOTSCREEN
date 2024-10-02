import 'package:flutter/material.dart';
import '../styles/app_colors.dart';  // Asumiendo que tienes un archivo de colores

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final double width;
  final bool disabled;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.width = 200.0,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.buttonTextColor,
          disabledBackgroundColor: AppColors.disabledColor,
          disabledForegroundColor: AppColors.disabledTextColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          texto,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
