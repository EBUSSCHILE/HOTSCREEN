import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/categories_menu_screen.dart';
import '../screens/karaoke_screen.dart';
import '../screens/help_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginScreen(),
    '/home': (context) => const CategoriesMenuScreen(
      categories: [
        'Karaoke',
        'Categoría 2',
        'Categoría 3',
      ],
    ),
    '/karaoke': (context) => const KaraokeScreen(),
    '/help': (context) => const HelpScreen(),
  };

  static String get initialRoute => '/';
}