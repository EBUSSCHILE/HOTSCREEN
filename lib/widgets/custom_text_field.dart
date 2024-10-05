import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.6;
    
    return Center(
      child: SizedBox(
        width: width,
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          onChanged: onChanged,
          style: const TextStyle(color: AppConstants.darkViolet),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppConstants.standardTextColor.withOpacity(0.7)),
            prefixIcon: Icon(icon, color: AppConstants.darkViolet),
            filled: true,
            fillColor: AppConstants.inputBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
              borderSide: BorderSide(color: AppConstants.darkViolet.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
              borderSide: const BorderSide(color: AppConstants.darkViolet),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
        ),
      ),
    );
  }
}
