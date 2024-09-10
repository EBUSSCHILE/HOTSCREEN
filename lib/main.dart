import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HotScreen',
      theme: AppTheme.getTheme(),
      home: const BackgroundWrapper(child: LoginScreen()),
    );
  }
}

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