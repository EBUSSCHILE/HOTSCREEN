import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class UserIcon extends StatelessWidget {
  final double size;

  const UserIcon({super.key, this.size = 36});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: AppConstants.primaryColor,
      child: Icon(
        Icons.person,
        color: AppConstants.appBarTextColor,
        size: size * 0.6,
      ),
    );
  }
}