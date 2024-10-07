import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SettingsButton extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;

  const SettingsButton({
    super.key,
    required this.isOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isOn,
      onChanged: onChanged,
      activeColor: AppConstants.primaryColor,
    );
  }
}
