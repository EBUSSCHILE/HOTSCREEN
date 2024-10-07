import 'package:flutter/material.dart';
import '../widgets/base_category_screen.dart';

class CategoryScreen03 extends StatelessWidget {
  const CategoryScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCategoryScreen(
      title: 'Categoría 3',
      searchHint: 'Buscar en Categoría 3',
      buttonText: 'Acción Categoría 3',
      onButtonPressed: () {
        // Acción para Categoría 3
      },
    );
  }
}
