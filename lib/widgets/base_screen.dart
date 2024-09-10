import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final Color backgroundColor;

  const BaseScreen({
    super.key, // Usamos super parameter
    required this.title,
    required this.body,
    this.backgroundColor = AppTheme.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
