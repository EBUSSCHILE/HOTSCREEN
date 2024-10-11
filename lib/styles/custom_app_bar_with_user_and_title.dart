import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'user_icon_button.dart';  // Cambiado de user_icon.dart a user_icon_button.dart

class CustomAppBarWithUserAndTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Color? backgroundColor;

  const CustomAppBarWithUserAndTitle({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppConstants.appBarBackgroundColor,
      title: Text(
        title,
        style: const TextStyle(color: AppConstants.appBarTextColor),
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppConstants.appBarIconColor),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppConstants.paddingMedium),
          child: UserIconButton(
            size: 32,
            onTap: () {
              // Acción al presionar el icono de usuario
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
