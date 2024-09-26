import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AppVariableBackground extends StatelessWidget {
  final Widget child;

  const AppVariableBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.8),
                  Theme.of(context).primaryColor.withOpacity(0.3),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: CustomAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 10),
            builder: (context, value, child) {
              return Opacity(
                opacity: 0.3,
                child: CustomPaint(
                  painter: BubblePainter(value),
                ),
              );
            },
          ),
        ),
        child,
      ],
    );
  }
}

class BubblePainter extends CustomPainter {
  final double animationValue;

  BubblePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.1);
    const bubbleCount = 50;

    for (var i = 0; i < bubbleCount; i++) {
      final progress = (i / bubbleCount + animationValue) % 1.0;
      final x = size.width * (i % 5) / 5;
      final y = size.height * progress;
      final radius = size.width / 30 * (1 - progress);

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(BubblePainter oldDelegate) => true;
}
