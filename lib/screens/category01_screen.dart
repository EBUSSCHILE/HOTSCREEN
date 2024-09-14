import 'package:flutter/material.dart';
import '../styles/text_styles.dart';

class Category01Screen extends StatelessWidget {
  const Category01Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Categoría 1',
          style: TextStyle(color: Colors.white),
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
                'Contenido de Categoría 01',
                style: AppTextStyles.categoryTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Puedes agregar más contenido específico de la categoría 1 aquí
            ],
          ),
        ),
      ),
    );
  }
}
