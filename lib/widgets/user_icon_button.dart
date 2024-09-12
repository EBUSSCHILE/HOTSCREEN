import 'package:flutter/material.dart';
import '../screens/login_home_screen.dart';
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';

class UserIconButton extends StatelessWidget {
  const UserIconButton({super.key});

  static const Color menuTextColor = Colors.white;
  static const Color menuIconColor = Colors.white;
  static const Color menuBackgroundColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: PopupMenuButton<String>(
        color: menuBackgroundColor,
        onSelected: (value) => _handleMenuSelection(context, value),
        itemBuilder: (BuildContext context) => const <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              children: [
                Icon(Icons.person, color: menuIconColor),
                SizedBox(width: 8),
                Text('Profile', style: TextStyle(color: menuTextColor)),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'settings',
            child: Row(
              children: [
                Icon(Icons.settings, color: menuIconColor),
                SizedBox(width: 8),
                Text('Settings', style: TextStyle(color: menuTextColor)),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: [
                Icon(Icons.exit_to_app, color: menuIconColor),
                SizedBox(width: 8),
                Text('Log out', style: TextStyle(color: menuTextColor)),
              ],
            ),
          ),
        ],
        child: const Icon(Icons.person, color: Colors.white),
      ),
    );
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
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginHomeScreen()),
          (Route<dynamic> route) => false,
        );
        break;
    }
  }
}

