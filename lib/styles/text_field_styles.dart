import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class TextFieldStyles {
  static InputDecoration getDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: AppConstants.darkViolet.withOpacity(0.7)),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(icon, color: AppConstants.darkViolet),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        borderSide: BorderSide(color: AppConstants.darkViolet.withOpacity(0.3)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppConstants.borderRadiusMedium)),
        borderSide: BorderSide(color: AppConstants.darkViolet),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    );
  }

  static const TextStyle textStyle = TextStyle(
    color: AppConstants.darkViolet,
    fontSize: 16,
  );
}
