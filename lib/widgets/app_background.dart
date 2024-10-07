import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppConstants.backgroundColor,
      ),
      child: child,
    );
  }
}
