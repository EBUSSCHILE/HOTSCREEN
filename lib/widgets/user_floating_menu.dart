import 'package:flutter/material.dart';
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart';

class UserFloatingMenu extends StatelessWidget {
  const UserFloatingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserProfileScreen(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingsScreen(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.pop(context); // Cierra el menú flotante
              // Aquí deberías implementar la lógica para cerrar la sesión
              // Por ejemplo, limpiar el token de autenticación, etc.
              // Luego, navegar a la pantalla de inicio de sesión
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
}
