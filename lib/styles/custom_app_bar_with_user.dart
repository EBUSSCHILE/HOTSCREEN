import 'package:flutter/material.dart';
// Eliminada la línea: import '../constants/app_constants.dart';
import 'user_icon_button.dart';

class CustomAppBarWithUser extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBarWithUser({
    super.key, // Convertido a super parámetro
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back), // Agregamos 'const' aquí
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        UserIconButton(
          size: 32,
          onTap: () {
            // Acción al presionar el icono de usuario
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
