import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';

class Category01Screen extends StatelessWidget {
  const Category01Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBarWithUserAndTitle(
          title: 'Category 01',
          showBackButton: true,
        ),
        body: Center(
          child: Text('Contenido de Category 01'),
        ),
      ),
    );
  }
}
