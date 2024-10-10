import 'package:flutter/material.dart';
import '../widgets/base_category_screen.dart';

class CategoryScreen03 extends StatelessWidget {
  const CategoryScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCategoryScreen(
      title: 'Categoría 03',
      searchHint: 'Buscar en Categoría 03',
      buttonText: 'Acción Categoría 03',
      onButtonPressed: () {
        // Acción del botón
      },
      content: ListView(
        children: const [
          ListTile(title: Text('Item 1 de Categoría 03')),
          ListTile(title: Text('Item 2 de Categoría 03')),
          // ... más items
        ],
      ),
    );
  }
}
