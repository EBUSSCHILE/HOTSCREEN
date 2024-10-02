import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppStyles {
  // Estilos de texto
  static const TextStyle headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppConstants.secondaryColor,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppConstants.secondaryColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: AppConstants.secondaryColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: AppConstants.secondaryColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    color: AppConstants.secondaryColor,
  );

  // Estilos de botones
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppConstants.primaryColor,
    foregroundColor: AppConstants.secondaryColor,
    padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium, vertical: AppConstants.paddingSmall),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
    ),
  );

  static ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: AppConstants.primaryColor,
    side: const BorderSide(color: AppConstants.primaryColor),
    padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium, vertical: AppConstants.paddingSmall),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
    ),
  );

  // Puedes agregar más estilos según sea necesario
}
