import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'screens/login_screen.dart'; // Importamos LoginScreen en lugar de SettingsScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HotScreen',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(), // Usamos LoginScreen como pantalla inicial
    );
  }
}