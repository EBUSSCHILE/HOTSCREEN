import 'package:flutter/material.dart';
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
      actions: const [
        UserIconButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
