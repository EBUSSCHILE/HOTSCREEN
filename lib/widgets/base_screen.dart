import 'package:flutter/material.dart';
import 'app_background.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseScreen({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
