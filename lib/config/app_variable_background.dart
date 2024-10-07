import 'package:flutter/material.dart';

class AppVariableBackground extends StatelessWidget {
  final Widget child;

  const AppVariableBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.purple,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
