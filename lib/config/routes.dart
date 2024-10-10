import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/categories_menu_screen.dart';
import '../screens/category_screen_01.dart';
import '../screens/category_screen_02.dart';
import '../screens/category_screen_03.dart';
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginScreen(),
    '/home': (context) => const CategoriesMenuScreen(
      categories: [
        'Categoría 1',
        'Categoría 2',
        'Categoría 3',
      ],
    ),
    '/category1': (context) => const CategoryScreen01(),
    '/category2': (context) => const CategoryScreen02(),
    '/category3': (context) => const CategoryScreen03(),
    '/profile': (context) => const UserProfileScreen(),
    '/settings': (context) => SettingsScreen(),
  };

  static String get initialRoute => '/';
}