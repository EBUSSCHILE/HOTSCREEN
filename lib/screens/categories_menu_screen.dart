import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/custom_button.dart';
import 'category01_screen.dart';
import 'category02_screen.dart';
import 'category03_screen.dart';

class CategoriesMenuScreen extends StatelessWidget {
  const CategoriesMenuScreen({super.key});

  void _navigateToCategory(BuildContext context, Widget categoryScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => categoryScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBarWithUserAndTitle(
          title: 'Categories',
          showBackButton: true,
          onBackPressed: () => Navigator.of(context).pop(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Category 01',
                onPressed: () => _navigateToCategory(context, const Category01Screen()),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Category 02',
                onPressed: () => _navigateToCategory(context, const Category02Screen()),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Category 03',
                onPressed: () => _navigateToCategory(context, const Category03Screen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
