import 'package:flutter/material.dart';
import 'user_icon_button.dart';

class CustomAppBarWithUser extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;

  const CustomAppBarWithUser({
    super.key,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: titleStyle),
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
