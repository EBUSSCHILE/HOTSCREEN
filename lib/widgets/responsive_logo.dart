import 'package:flutter/material.dart';

class ResponsiveLogo extends StatelessWidget {
  final String largeLogo;
  final String smallLogo;
  final double widthFactor;

  const ResponsiveLogo({
    super.key,
    required this.largeLogo,
    required this.smallLogo,
    this.widthFactor = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Image.asset(
      isLargeScreen ? largeLogo : smallLogo,
      width: screenWidth * widthFactor,
      fit: BoxFit.contain,
    );
  }
}
