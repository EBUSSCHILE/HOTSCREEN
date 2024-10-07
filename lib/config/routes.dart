import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/categories_menu_screen.dart';
import '../screens/category_screen_01.dart';
import '../screens/category_screen_02.dart';
import '../screens/category_screen_03.dart';
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';

class Routes {
  static const String login = '/login';
  static const String categoriesMenu = '/categories';
  static const String category1 = '/category1';
  static const String category2 = '/category2';
  static const String category3 = '/category3';
  static const String userProfile = '/profile';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      categoriesMenu: (context) => CategoriesMenuScreen(),
      category1: (context) => const CategoryScreen01(),
      category2: (context) => const CategoryScreen02(),
      category3: (context) => const CategoryScreen03(),
      userProfile: (context) => const UserProfileScreen(),
      settings: (context) => SettingsScreen(),
    };
  }
}