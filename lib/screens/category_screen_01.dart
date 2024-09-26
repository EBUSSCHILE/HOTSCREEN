import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';

class CategoryScreen01 extends StatelessWidget {
  const CategoryScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithUserAndTitle(
        title: 'Category 01',
        showBackButton: true,
      ),
      body: Center(
        child: Text(
          'Contenido de la Categoría 01',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}