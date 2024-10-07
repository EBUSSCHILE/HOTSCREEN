import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'user_icon.dart';

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
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: AppConstants.paddingMedium),
          child: UserIcon(size: 32), // Mantenemos el tamaño ajustado para la AppBar
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
