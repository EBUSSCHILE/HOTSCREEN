import 'package:flutter/material.dart';
import '../widgets/background_wrapper.dart';
import '../widgets/custom_app_bar.dart';

class Category03 extends StatelessWidget {
  const Category03({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundWrapper(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Comida y Bebidas'),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Contenido de la Categoría 3: Comida y Bebidas'),
        ),
      ),
    );
  }
}
