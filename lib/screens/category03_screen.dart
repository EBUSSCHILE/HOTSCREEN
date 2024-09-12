import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';

class Category03Screen extends StatelessWidget {
  const Category03Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBarWithUserAndTitle(
          title: 'Category 03',
          showBackButton: true,
        ),
        body: Center(
          child: Text('Contenido de Category 03'),
        ),
      ),
    );
  }
}
