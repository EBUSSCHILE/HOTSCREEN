import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/custom_list_tile.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000080), // Color de fondo estándar
      appBar: const CustomAppBarWithUserAndTitle(
        title: 'Ayuda',
        showBackButton: true,
      ),
      body: ListView(
        children: [
          CustomListTile(
            icon: Icons.question_answer,
            title: 'Preguntas frecuentes',
            onTap: () {
              // Navegar a las preguntas frecuentes
            },
          ),
          CustomListTile(
            icon: Icons.contact_support,
            title: 'Contactar soporte',
            onTap: () {
              // Abrir pantalla de contacto con soporte
            },
          ),
          CustomListTile(
            icon: Icons.book,
            title: 'Guía del usuario',
            onTap: () {
              // Abrir guía del usuario
            },
          ),
        ],
      ),
    );
  }
}
