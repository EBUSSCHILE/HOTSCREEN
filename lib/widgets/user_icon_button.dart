import 'package:flutter/material.dart';
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart'; // Actualizamos esta importación

class UserIconButton extends StatelessWidget {
  const UserIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.person, color: Colors.white),
      onSelected: (String result) {
        switch (result) {
          case 'profile':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfileScreen()),
            );
            break;
          case 'settings':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),  // Removemos 'const'
            );
            break;
          case 'logout':
            _handleLogout(context);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'profile',
          child: Text('Perfil de Usuario', style: TextStyle(color: Colors.white)),
        ),
        const PopupMenuItem<String>(
          value: 'settings',
          child: Text('Configuración', style: TextStyle(color: Colors.white)),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Cerrar Sesión', style: TextStyle(color: Colors.white)),
        ),
      ],
      color: const Color(0xFF4B0082), // Violeta oscuro
      elevation: 8,
    );
  }

  void _handleLogout(BuildContext context) async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Cerrar Sesión',
            style: TextStyle(color: Colors.black),
          ),
          content: const Text(
            '¿Estás seguro de que quieres cerrar sesión?',
            style: TextStyle(color: Colors.purple),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () => Navigator.of(dialogContext).pop(false),
            ),
            TextButton(
              child: const Text(
                'Sí, cerrar sesión',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      // Verificamos si el widget aún está montado antes de usar el contexto
      if (context.mounted) {
        _performLogout(context);
      }
    }
  }

  void _performLogout(BuildContext context) {
    // Aquí iría la lógica de cierre de sesión si la tuvieras
    // Por ejemplo, limpiar tokens de autenticación, etc.

    // Navegar a la pantalla de login
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}

