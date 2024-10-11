import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart';

class FloatingUserMenu extends StatelessWidget {
  const FloatingUserMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppConstants.primaryColor,
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuItem(
              context,
              'Ver perfil',
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen())),
            ),
            _buildMenuItem(
              context,
              'Configuración',
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen())),
            ),
            _buildMenuItem(
              context,
              'Cerrar sesión',
              () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
