import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import 'floating_user_menu.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              _showFloatingMenu(context);
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: AppTheme.primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  void _showFloatingMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero, ancestor: overlay);

    final double left = offset.dx - 200 + button.size.width; // 200 es el ancho aproximado del menú
    final double top = offset.dy + button.size.height - 20; // Subimos 20 píxeles

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, left + 200, top),
      items: const [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: FloatingUserMenu(),
        ),
      ],
      elevation: 8.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
