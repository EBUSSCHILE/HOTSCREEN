import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class OptionText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const OptionText({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: AppConstants.optionTextColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
