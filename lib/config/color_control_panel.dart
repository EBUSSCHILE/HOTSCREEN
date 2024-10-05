import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ColorControlPanel extends StatelessWidget {
  const ColorControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      color: themeProvider.backgroundColor,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aquí puedes agregar la lógica para cambiar el color
            // Por ejemplo:
            // themeProvider.setBackgroundColor(Colors.red);
          },
          child: const Text('Cambiar Color'),
        ),
      ),
    );
  }

  // Si no estás usando este método, puedes eliminarlo
  // void _onColorChanged(BuildContext context, Color color) {
  //   Provider.of<ThemeProvider>(context, listen: false).setBackgroundColor(color);
  // }
}
