import 'package:flutter/material.dart';
import '../widgets/background_wrapper.dart';
import '../widgets/custom_app_bar.dart';

class Category02 extends StatelessWidget {
  const Category02({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundWrapper(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Trabajos y Escuela'),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Contenido de la Categoría 2: Trabajos y Escuela'),
        ),
      ),
    );
  }
}
