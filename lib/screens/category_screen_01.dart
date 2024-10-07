import 'package:flutter/material.dart';
import '../widgets/base_category_screen.dart';

class CategoryScreen01 extends StatelessWidget {
  const CategoryScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCategoryScreen(
      title: 'Categoría 1',
      searchHint: 'Buscar en Categoría 1',
      buttonText: 'Acción Categoría 1',
      onButtonPressed: () {
        // Acción para Categoría 1
      },
    );
  }
}