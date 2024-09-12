import 'package:flutter/material.dart';
// Eliminamos la siguiente línea:
// import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  static const darkPurple = Color(0xFF2A0E61);
  static const lightPurple = Color(0xFFB39DDB);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    // ... otros ajustes del tema claro ...
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    // ... otros ajustes del tema oscuro ...
  );

  static BoxDecoration backgroundDecoration(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDarkMode ? darkPurple : null,
      image: isDarkMode
          ? null
          : const DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
    );
  }
}
