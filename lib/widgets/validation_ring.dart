import 'package:flutter/material.dart';
import '../services/validation_service.dart';

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
    _loadValidationState();
  }

  Future<void> _loadValidationState() async {
    final isValidated = await ValidationService.getComponentValidation(
      widget.className,
      widget.componentName,
    );
    setState(() {
      _isValidated = isValidated;
    });
  }

  Future<void> _toggleValidation() async {
    final newState = !_isValidated;
    await ValidationService.setComponentValidation(
      widget.className,
      widget.componentName,
      newState,
    );
    setState(() {
      _isValidated = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleValidation,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isValidated ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
