import 'package:flutter/material.dart';
import '../widgets/base_category_screen.dart';

class CategoryScreen02 extends StatelessWidget {
  const CategoryScreen02({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCategoryScreen(
      title: 'Categoría 02',
      searchHint: 'Buscar en Categoría 02',
      buttonText: 'Acción Categoría 02',
      onButtonPressed: () {
        // Acción del botón
      },
      content: ListView(
        children: const [
          ListTile(title: Text('Item 1 de Categoría 02')),
          ListTile(title: Text('Item 2 de Categoría 02')),
          // ... más items
        ],
      ),
    );
  }
}
