import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SettingsSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: AppConstants.lightSwitchThumbColor,
      activeTrackColor: AppConstants.lightSwitchThumbColor.withOpacity(0.5),
      inactiveThumbColor: AppConstants.lightSwitchInactiveThumbColor,
      inactiveTrackColor: AppConstants.lightInputBackgroundColor.withOpacity(0.5),
      thumbColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.lightSwitchThumbColor;
        }
        return AppConstants.lightSwitchInactiveThumbColor;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.lightSwitchThumbColor.withOpacity(0.5);
        }
        return AppConstants.lightInputBackgroundColor.withOpacity(0.5);
      }),
    );
  }
}