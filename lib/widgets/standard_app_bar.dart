import 'package:flutter/material.dart';
import '../constants/app_constants.dart'; // Cambiamos la importación
import '../screens/user_profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  const StandardAppBar({
    super.key, // Convertido a super parámetro
    required this.title,
    this.actions,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppConstants.appBarBackgroundColor,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: AppConstants.appBarTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(color: AppConstants.appBarIconColor),
      leading: showBackButton ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ) : null,
      actions: [
        ...(actions ?? []),
        Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.person, color: AppConstants.appBarIconColor),
              offset: const Offset(0, 40), // Subimos el menú 10 píxeles más
              onSelected: (String result) {
                switch (result) {
                  case 'profile':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
                    break;
                  case 'settings':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                    break;
                  case 'logout':
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false,
                    );
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('Ver perfil', style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Configuración', style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
                ),
              ],
              color: AppConstants.appBarBackgroundColor.lighten(0.2), // Aclaramos el color del menú
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Extensión para aclarar colores
extension ColorExtension on Color {
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}
