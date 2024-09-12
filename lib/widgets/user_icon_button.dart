import 'package:flutter/material.dart';
import '../screens/login_home_screen.dart';
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';

class UserIconButton extends StatelessWidget {
  const UserIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: GestureDetector(
        onTap: () {
          _showUserMenu(context);
        },
        child: const Icon(Icons.person, color: Colors.white),
      ),
    );
  }

  void _showUserMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'profile',
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'settings',
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
          ),
        ),
      ],
    ).then((String? value) {
      if (value != null && context.mounted) {
        _handleMenuSelection(context, value);
      }
    });
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'profile':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfileScreen()));
        break;
      case 'settings':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
        break;
      case 'logout':
        // Aquí podrías añadir lógica para cerrar sesión antes de navegar
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginHomeScreen()),
          (Route<dynamic> route) => false,
        );
        break;
    }
  }
}

