import 'package:flutter/material.dart';
import '../constants/app_constants.dart';  // Asumiendo que tienes un archivo de colores

class CustomButton extends StatefulWidget {
  final String texto;
  final VoidCallback onPressed;
  final double width;
  final bool disabled;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.width = 200.0,
    this.disabled = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _updateHoverState(true),
      onExit: (_) => _updateHoverState(false),
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.pink.withOpacity(0.5) : Colors.red.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: widget.disabled ? null : widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstants.darkViolet,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.white54,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            widget.texto,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _updateHoverState(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
