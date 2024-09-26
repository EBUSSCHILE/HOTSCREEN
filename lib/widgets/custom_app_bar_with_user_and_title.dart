import 'package:flutter/material.dart';
import 'user_icon_button.dart'; // Asegúrate de que esta ruta es correcta

class CustomAppBarWithUserAndTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const CustomAppBarWithUserAndTitle({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(title),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 50.0), // 50 píxeles del margen derecho
          child: UserIconButton(), // Reintroducir el UserIconButton
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor, // Mantener el color del tema
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
