import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.pageBackground,
      child: child,
    );
  }
}
