import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/color_model.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorModel>(
      builder: (context, colorModel, _) => Container(
        color: colorModel.backgroundColor,
        child: child,
      ),
    );
  }
}
