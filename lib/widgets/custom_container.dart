import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget child;

  const CustomContainer({
    super.key, // Cambiamos a super.key
    required this.constraints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Container(
          constraints: constraints,
          child: child,
        );
      },
    );
  }
}