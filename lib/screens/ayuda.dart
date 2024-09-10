import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Ayuda',
      body: Center(
        child: Text('Contenido de Ayuda'),
      ),
    );
  }
}
