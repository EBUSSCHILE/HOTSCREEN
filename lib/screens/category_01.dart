import 'package:flutter/material.dart';
import '../widgets/background_wrapper.dart';
import '../widgets/custom_app_bar.dart';

class Category01 extends StatelessWidget {
  const Category01({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundWrapper(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Introducción'),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Contenido de la Categoría 1: Introducción'),
        ),
      ),
    );
  }
}
