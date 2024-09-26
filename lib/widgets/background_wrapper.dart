import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hotscreen/providers/theme_provider.dart';
import 'package:hotscreen/config/app_variable_background.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    if (themeProvider.useVariableBackground) {
      return AppVariableBackground(child: child);
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: child,
      );
    }
  }
}
