import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/custom_button.dart';
import '../styles/button_styles.dart';
import 'category_screen_01.dart';
import 'category_screen_02.dart';
import 'category_screen_03.dart';

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
    return Scaffold(
      appBar: const CustomAppBarWithUserAndTitle(
        title: 'Categories',
        showBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              texto: 'Category 01',
              onPressed: () => _navigateToCategory(context, const CategoryScreen01()),
              tamano: ButtonSize.medium,
            ),
            const SizedBox(height: 20),
            CustomButton(
              texto: 'Category 02',
              onPressed: () => _navigateToCategory(context, const CategoryScreen02()),
              tamano: ButtonSize.medium,
            ),
            const SizedBox(height: 20),
            CustomButton(
              texto: 'Category 03',
              onPressed: () => _navigateToCategory(context, const CategoryScreen03()),
              tamano: ButtonSize.medium,
            ),
          ],
        ),
      ),
    );
  }
}
