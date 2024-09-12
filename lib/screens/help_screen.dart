import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/custom_list_tile.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBarWithUserAndTitle(
          title: 'Help',
          showBackButton: true,
        ),
        body: ListView(
          children: [
            CustomListTile(
              icon: Icons.question_answer,
              title: 'FAQs',
              onTap: () {
                // Navegar a las preguntas frecuentes
              },
            ),
            CustomListTile(
              icon: Icons.contact_support,
              title: 'Contact Support',
              onTap: () {
                // Abrir pantalla de contacto con soporte
              },
            ),
            CustomListTile(
              icon: Icons.book,
              title: 'User Guide',
              onTap: () {
                // Abrir guía del usuario
              },
            ),
          ],
        ),
      ),
    );
  }
}
