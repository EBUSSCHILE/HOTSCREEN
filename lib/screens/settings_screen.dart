import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/custom_list_tile.dart';
import 'help_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBarWithUserAndTitle(
          title: 'Settings',
          showBackButton: true,
        ),
        body: ListView(
          children: [
            CustomListTile(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // Lógica para configuración de notificaciones
              },
            ),
            CustomListTile(
              icon: Icons.lock,
              title: 'Privacy',
              onTap: () {
                // Lógica para configuración de privacidad
              },
            ),
            CustomListTile(
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                // Lógica para configuración de idioma
              },
            ),
            CustomListTile(
              icon: Icons.help,
              title: 'Help',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HelpScreen()),
                );
              },
            ),
            CustomListTile(
              icon: Icons.info,
              title: 'About',
              onTap: () {
                // Lógica para información sobre la app
              },
            ),
          ],
        ),
      ),
    );
  }
}
