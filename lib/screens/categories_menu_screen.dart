import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../constants/app_constants.dart';
import '../styles/custom_app_bar.dart'; // Cambiado de standard_app_bar.dart a custom_app_bar.dart
import '../services/file_validation_service.dart';
import 'karaoke_screen.dart';  // Importamos la nueva pantalla
import 'whiteboard_screen.dart'; // Añadimos esta importación
import '../services/validation_service.dart'; // Cambia esta línea

class CategoriesMenuScreen extends StatelessWidget {
  final List<String> categories;

  const CategoriesMenuScreen({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: const CustomAppBar( // Cambiado de StandardAppBar a CustomAppBar
        title: 'Categorías',
        showBackButton: true,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double maxWidth = constraints.maxWidth * 0.8;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        ...categories.asMap().entries.map((entry) {
                          int idx = entry.key;
                          String category = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: maxWidth,
                                  child: FutureBuilder<String?>(
                                    future: FileValidationService.getComponentName('CategoriesMenuScreen', 'Category_$idx'),
                                    builder: (context, snapshot) {
                                      String buttonText;
                                      if (idx == 0) {
                                        buttonText = 'Karaoke';
                                      } else if (idx == 1) {
                                        buttonText = 'Whiteboard';
                                      } else {
                                        buttonText = snapshot.data ?? category;
                                      }
                                      return CustomButton(
                                        text: buttonText,
                                        onPressed: () {
                                          if (idx == 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const KaraokeScreen()),
                                            );
                                          } else if (idx == 1) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const WhiteboardScreen()),
                                            );
                                          } else {
                                            // Acción para otras categorías
                                          }
                                        },
                                        backgroundColor: AppConstants.primaryColor,
                                        textColor: AppConstants.buttonTextColor,
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: ValidationService.buildValidationRing(
                                    'CategoriesMenuScreen',
                                    'Category_$idx',
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: ValidationService.buildValidationRing(
              'CategoriesMenuScreen',
              'CategoriesMenuScreen',
            ),
          ),
        ],
      ),
    );
  }
}
