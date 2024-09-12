import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        // Usa el tema actual para determinar el fondo
        color: themeProvider.currentTheme.scaffoldBackgroundColor,
        // Añade más decoración si es necesario
      ),
      child: child,
    );
  }
}
