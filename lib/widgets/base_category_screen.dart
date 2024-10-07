import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/standard_app_bar.dart';

class BaseCategoryScreen extends StatelessWidget {
  final String title;
  final String searchHint;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const BaseCategoryScreen({
    super.key,
    required this.title,
    required this.searchHint,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardAppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildSearchField(),
              const SizedBox(height: 20),
              _buildActionButton(),
              const SizedBox(height: 20),
              // Aquí puedes agregar más contenido específico de la categoría
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return CustomTextField(
      hintText: searchHint,
      icon: Icons.search,
    );
  }

  Widget _buildActionButton() {
    return CustomButton(
      text: buttonText,
      onPressed: onButtonPressed,
      size: ButtonSize.large,
    );
  }
}