import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hotscreen/providers/theme_provider.dart';
import 'package:hotscreen/screens/help_screen.dart';  // Añade esta línea

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});  // Cambiado aquí

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: ListView(
        children: [
          _buildListTile(
            icon: Icons.language,
            title: 'Idioma',
            subtitle: 'Español',
            onTap: () {
              // Implementar cambio de idioma
            },
          ),
          _buildListTile(
            icon: Icons.notifications,
            title: 'Notificaciones',
            subtitle: 'Activadas',
            onTap: () {
              // Implementar configuración de notificaciones
            },
          ),
          _buildListTile(
            icon: Icons.privacy_tip,
            title: 'Privacidad',
            subtitle: 'Configurar opciones de privacidad',
            onTap: () {
              // Implementar configuración de privacidad
            },
          ),
          SwitchListTile(
            title: const Text('Fondo Variable', style: TextStyle(color: Colors.white)),
            value: themeProvider.useVariableBackground,
            onChanged: (bool value) {
              themeProvider.toggleBackground();
            },
          ),
          _buildListTile(
            icon: Icons.help,
            title: 'Ayuda',
            subtitle: 'Preguntas frecuentes y soporte',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: onTap,
    );
  }
}
