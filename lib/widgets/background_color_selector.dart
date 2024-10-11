import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../providers/theme_provider.dart';

class BackgroundColorSelector extends StatelessWidget {
  const BackgroundColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return DropdownButton<Color>(
      value: themeProvider.backgroundColor,
      onChanged: (Color? newValue) {
        if (newValue != null) {
          themeProvider.setBackgroundColor(newValue);
        }
      },
      items: [
        const DropdownMenuItem(
          value: AppConstants.backgroundColor,
          child: Text('Azul Oscuro'),
        ),
        const DropdownMenuItem(
          value: AppConstants.darkViolet,
          child: Text('Violeta Oscuro'),
        ),
        const DropdownMenuItem(
          value: AppConstants.marengo,
          child: Text('Marengo'),
        ),
      ],
    );
  }
}
