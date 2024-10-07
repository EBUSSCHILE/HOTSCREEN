import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/color_model.dart';
import 'services/auth_service.dart';
import 'styles/app_theme.dart';
import 'config/routes.dart';
import 'utils/error_handler.dart';

void main() {
  ErrorHandler.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorModel()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HotScreen',
      theme: AppTheme.lightTheme,
      initialRoute: Routes.login,
      routes: Routes.getRoutes(),
    );
  }
}