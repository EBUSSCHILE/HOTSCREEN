import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Widget trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.title,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: AppConstants.standardTextColor),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}