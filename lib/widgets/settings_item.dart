import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../styles/app_styles.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SettingsItem({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingSmall),
      decoration: BoxDecoration(
        color: AppConstants.settingsItemBackgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(color: AppConstants.primaryColor, width: 1),
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppStyles.bodyLarge.copyWith(color: AppConstants.optionTextColor),
        ),
        trailing: trailing,
      ),
    );
  }
}