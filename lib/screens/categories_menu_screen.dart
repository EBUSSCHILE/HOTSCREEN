import 'package:flutter/material.dart';
import '../widgets/standard_app_bar.dart';
import '../widgets/custom_button.dart';
import 'category_screen_01.dart';
import 'category_screen_02.dart';
import 'category_screen_03.dart';

class CategoriesMenuScreen extends StatelessWidget {
  const CategoriesMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(
        title: 'Categorías',
        showBackButton: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              texto: 'Categoría 1',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen01()),
                );
              },
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(height: 20),
            CustomButton(
              texto: 'Categoría 2',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen02()),
                );
              },
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(height: 20),
            CustomButton(
              texto: 'Categoría 3',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen03()),
                );
              },
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
