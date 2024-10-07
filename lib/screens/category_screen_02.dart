import 'package:flutter/material.dart';
import '../widgets/base_category_screen.dart';

class CategoryScreen02 extends StatelessWidget {
  const CategoryScreen02({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCategoryScreen(
      title: 'Categoría 2',
      searchHint: 'Buscar en Categoría 2',
      buttonText: 'Acción Categoría 2',
      onButtonPressed: () {
        // Acción para Categoría 2
      },
    );
  }
}
