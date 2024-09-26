import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';

class CategoryScreen02 extends StatelessWidget {
  const CategoryScreen02({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithUserAndTitle(
        title: 'Category 02',
        showBackButton: true,
      ),
      body: Center(
        child: Text(
          'Contenido de la Categoría 02',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
