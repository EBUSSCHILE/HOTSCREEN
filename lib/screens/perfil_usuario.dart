import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Perfil de Usuario',
      body: Center(
        child: Text('Contenido del Perfil de Usuario'),
      ),
    );
  }
}
