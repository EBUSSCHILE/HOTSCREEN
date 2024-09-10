import 'package:flutter/material.dart';
// import '../config/app_theme.dart'; // Esta línea se puede eliminar
import '../screens/profile_page.dart';
import '../screens/settings_page.dart';
import '../screens/login_screen.dart';

class FloatingUserMenu extends StatelessWidget {
  const FloatingUserMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Ancho fijo
      decoration: BoxDecoration(
        color: const Color(0xFF4A0E4E), // Color violeta más oscuro
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMenuItem(
            context,
            'Perfil',
            Icons.person,
            () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage())),
          ),
          _buildMenuItem(
            context,
            'Configuración',
            Icons.settings,
            () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage())),
          ),
          _buildMenuItem(
            context,
            'Cerrar Sesión',
            Icons.exit_to_app,
            () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
