import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'user_icon_button.dart'; // Cambiado de user_icon.dart a user_icon_button.dart
import '../widgets/validation_ring.dart';
import 'floating_user_menu.dart'; // Asegúrate de que esta importación esté presente

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          backgroundColor: AppConstants.appBarBackgroundColor,
          elevation: 0,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          leading: showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: PopupMenuButton<void>(
                offset: const Offset(0, -2),
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<void>(
                    padding: EdgeInsets.zero,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        textTheme: Theme.of(context).textTheme.copyWith(
                          bodyMedium: const TextStyle(
                            fontSize: 9.6,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: const FloatingUserMenu(),
                    ),
                  ),
                ],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                elevation: 0,
                color: AppConstants.primaryColor,
                child: const UserIconButton(size: 32),
              ),
            ),
          ],
        ),
        const Positioned(
          right: 4,
          top: 4,
          child: ValidationRing(
            className: 'CustomAppBar',
            componentName: 'CustomAppBar',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
