import 'package:flutter/material.dart';
import 'background_wrapper.dart';
import 'custom_app_bar.dart';

class ScreenWrapper extends StatelessWidget {
  final String title;
  final Widget body;

  const ScreenWrapper({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
