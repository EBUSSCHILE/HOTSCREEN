import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/custom_button.dart';
import 'category01_screen.dart';
import 'category02_screen.dart';
import 'category03_screen.dart';

class CategoriesMenuScreen extends StatelessWidget {
  const CategoriesMenuScreen({super.key});

  void _navigateToCategory(BuildContext context, Widget categoryScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => categoryScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBarWithUserAndTitle(
          title: 'Categories',
          showBackButton: true,
          onBackPressed: () => Navigator.of(context).pop(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                texto: 'Category 01', // Reemplazado 'text' por 'texto'
                onPressed: () => _navigateToCategory(context, const Category01Screen()),
                tamano: ButtonSize.medium, // Opcional
              ),
              const SizedBox(height: 20),
              CustomButton(
                texto: 'Category 02', // Reemplazado 'text' por 'texto'
                onPressed: () => _navigateToCategory(context, const Category02Screen()),
                tamano: ButtonSize.medium,
              ),
              const SizedBox(height: 20),
              CustomButton(
                texto: 'Category 03', // Reemplazado 'text' por 'texto'
                onPressed: () => _navigateToCategory(context, const Category03Screen()),
                tamano: ButtonSize.medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
