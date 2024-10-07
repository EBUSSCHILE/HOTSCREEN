import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

enum ButtonType { primary, secondary }
enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final ButtonSize size;
  final double? width;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.width,
    this.textColor = AppConstants.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = _getButtonStyle();
    final TextStyle textStyle = _getTextStyle();

    return SizedBox(
      width: width ?? _getButtonWidth(),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(text, style: textStyle),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: type == ButtonType.primary
          ? AppConstants.primaryColor
          : AppConstants.secondaryColor,
      padding: _getButtonPadding(),
    );
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontSize: _getFontSize(),
      color: textColor,
    );
  }

  double _getButtonWidth() {
    switch (size) {
      case ButtonSize.small:
        return 120;
      case ButtonSize.large:
        return 200;
      default:
        return 160;
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 14;
      case ButtonSize.large:
        return 18;
      default:
        return 16;
    }
  }

  EdgeInsets _getButtonPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 32);
      default:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 24);
    }
  }
}
