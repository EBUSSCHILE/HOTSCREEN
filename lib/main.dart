import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hotscreen/providers/theme_provider.dart';
import 'package:hotscreen/screens/login_home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'HotScreen',
          theme: themeProvider.theme,  // Cambiado de getTheme() a theme
          home: const LoginHomeScreen(),
        );
      },
    );
  }
}