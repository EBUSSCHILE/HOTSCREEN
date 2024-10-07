import 'package:flutter/material.dart';

import '../widgets/app_background.dart';
import '../widgets/custom_button.dart';
import '../widgets/standard_app_bar.dart';
import 'category_screen_01.dart';
import 'category_screen_02.dart';
import 'category_screen_03.dart';

class CategoryInfo {
  final String name;
  final Widget screen;

  const CategoryInfo(this.name, this.screen);
}

class CategoriesMenuScreen extends StatelessWidget {
  CategoriesMenuScreen({super.key});

  final List<CategoryInfo> categories = [
    const CategoryInfo('Categoría 1', CategoryScreen01()),
    const CategoryInfo('Categoría 2', CategoryScreen02()),
    const CategoryInfo('Categoría 3', CategoryScreen03()),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const StandardAppBar(
          title: 'Categorías',
          showBackButton: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return _buildCategoryButton(context, categories[index]);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, CategoryInfo category) {
    return CustomButton(
      text: category.name,  // Cambiado de 'texto' a 'text'
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => category.screen),
        );
      },
      size: ButtonSize.large,  // Cambiado de 'tamano' a 'size' y usando el enum
    );
  }
}
