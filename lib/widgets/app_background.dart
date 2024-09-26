import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa el paquete flutter_svg

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background_pattern.svg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        child, // El contenido de la aplicación se superpone al fondo
      ],
    );
  }
}
