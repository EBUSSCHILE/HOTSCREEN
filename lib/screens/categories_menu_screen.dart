import 'package:flutter/material.dart';
import '../widgets/validation_wrapper.dart';
// Elimina la importación no utilizada de app_background.dart

class CategoriesMenuScreen extends StatelessWidget {
  final List<String> categories;

  const CategoriesMenuScreen({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return ValidationWrapper(
      componentName: 'CategoriesMenuScreen',
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return const Center(
      child: Text('Categorías'),
    );
  }
}
