import 'package:flutter/material.dart';
import '../widgets/base_category_screen.dart';

class CategoryScreen01 extends StatelessWidget {
  const CategoryScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCategoryScreen(
      title: 'Categoría 01',
      searchHint: 'Buscar en Categoría 01',
      buttonText: 'Acción Categoría 01',
      onButtonPressed: () {
        // Acción del botón
      },
      content: ListView(
        children: const [
          ListTile(title: Text('Item 1 de Categoría 01')),
          ListTile(title: Text('Item 2 de Categoría 01')),
          // ... más items
        ],
      ),
    );
  }
}