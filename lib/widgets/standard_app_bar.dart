import 'package:flutter/material.dart';
import '../styles/text_styles.dart';
import 'user_icon_button.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const StandardAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: AppTextStyles.big.copyWith(color: Colors.white),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: UserIconButton(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
