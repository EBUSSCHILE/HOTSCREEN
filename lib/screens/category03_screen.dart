import 'package:flutter/material.dart';
import '../styles/text_styles.dart';  // Asegúrate de que esta importación sea correcta

class Category03Screen extends StatelessWidget {
  const Category03Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Categoría 3',
          style: TextStyle(color: Colors.white), // Aplicamos el color blanco al título
        ),
        backgroundColor: const Color(0xFF000080),
      ),
      body: Container(
        color: const Color(0xFF000080),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenido a la Categoría 3',
                style: AppTextStyles.categoryTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Aquí encontrarás información relevante sobre la Categoría 3.',
                style: AppTextStyles.categoryDescription,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
