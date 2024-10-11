import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class UserIconButton extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const UserIconButton({
    super.key,
    this.size = 32,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: AppConstants.primaryColor,
        child: ClipOval(
          child: Image.asset(
            'assets/images/default_avatar.png',
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

