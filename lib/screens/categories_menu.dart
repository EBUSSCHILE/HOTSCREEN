import 'package:flutter/material.dart';
import '../widgets/background_wrapper.dart';
import '../widgets/custom_app_bar.dart';
import 'category_01.dart';
import 'category_02.dart';
import 'category_03.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Categorías'),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Category01()),
                    );
                  },
                  child: const Text('Categoría 1: Introducción'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Category02()),
                    );
                  },
                  child: const Text('Categoría 2: Trabajos y Escuela'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Category03()),
                    );
                  },
                  child: const Text('Categoría 3: Comida y Bebidas'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
