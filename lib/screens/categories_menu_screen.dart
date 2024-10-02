import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart' as app_widgets;
import '../widgets/custom_app_bar_with_user_and_title.dart';
import 'category_screen_01.dart';
import 'category_screen_02.dart';
import 'category_screen_03.dart';

class CategoriesMenuScreen extends StatelessWidget {
  const CategoriesMenuScreen({super.key});

  void _navigateToCategory(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithUserAndTitle(
        title: 'Categorías',
        showBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            app_widgets.CustomButton(
              texto: 'Category 01',
              onPressed: () => _navigateToCategory(context, const CategoryScreen01()),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 20),
            app_widgets.CustomButton(
              texto: 'Category 02',
              onPressed: () => _navigateToCategory(context, const CategoryScreen02()),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 20),
            app_widgets.CustomButton(
              texto: 'Category 03',
              onPressed: () => _navigateToCategory(context, const CategoryScreen03()),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
