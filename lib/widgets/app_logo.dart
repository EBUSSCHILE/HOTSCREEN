import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double logoWidth;

    if (screenWidth > 1200) {
      logoWidth = screenWidth * 0.3;
    } else if (screenWidth > 600) {
      logoWidth = screenWidth * 0.4;
    } else {
      logoWidth = screenWidth * 0.6;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: logoWidth,
        maxHeight: logoWidth * 0.3,
      ),
      child: Image.asset(
        'assets/images/hotscreen_sinfondo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}