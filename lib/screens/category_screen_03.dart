import 'package:flutter/material.dart';
import '../widgets/standard_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../constants/app_constants.dart';

class CategoryScreen03 extends StatelessWidget {
  const CategoryScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(
        title: 'Categoría 3',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CustomTextField(
                hintText: 'Buscar en Categoría 3',
                icon: Icons.search,
              ),
              const SizedBox(height: 20),
              CustomButton(
                texto: 'Acción Categoría 3',
                onPressed: () {
                  // Acción para Categoría 3
                },
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 20),
              // Aquí puedes agregar más contenido específico de la Categoría 3
            ],
          ),
        ),
      ),
    );
  }
}
