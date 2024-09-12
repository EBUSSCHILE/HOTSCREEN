import 'package:flutter/material.dart';
import 'text_styles.dart';

class TextFieldStyles {
  static TextStyle get inputText => AppTextStyles.inputText;
  static TextStyle get hintText => AppTextStyles.hintText;

  static InputDecoration getDecoration({
    String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextFieldStyles.hintText,
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppTextStyles.mediumPurple) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: AppTextStyles.mediumPurple) : null,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    );
  }
}
