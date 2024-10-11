import 'package:flutter/material.dart';
import '../services/file_validation_service.dart';

class ValidationRing extends StatefulWidget {
  final String className;
  final String componentName;

  const ValidationRing({
    super.key,
    required this.className,
    required this.componentName,
  });

  @override
  State<ValidationRing> createState() => _ValidationRingState();
}

class _ValidationRingState extends State<ValidationRing> {
  bool _isValidated = false;

  @override
  void initState() {
    super.initState();
    _checkValidation();
  }

  Future<void> _checkValidation() async {
    final isValidated = await FileValidationService.getComponentValidation(
      widget.className,
      widget.componentName,
    );
    setState(() {
      _isValidated = isValidated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () async {
        await FileValidationService.setComponentValidation(
          widget.className,
          widget.componentName,
          !_isValidated,
        );
        await _checkValidation();
      },
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: _isValidated ? Colors.green : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}