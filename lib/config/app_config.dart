import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import 'app_theme.dart';

class AppConfig extends StatelessWidget {
  final Color backgroundColor;

  const AppConfig({
    super.key, // Usamos super parameter
    this.backgroundColor = AppTheme.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Configuración',
      backgroundColor: backgroundColor,
      body: const Center(
        child: Text('Contenido de Configuración'),
      ),
    );
  }

  static ThemeData getTheme() {
    return AppTheme.getTheme(); // Ahora esto debería funcionar correctamente
  }
}