import 'package:flutter/material.dart';
import '../services/file_validation_service.dart';

class ValidationWrapper extends StatefulWidget {
  final Widget child;
  final String componentName;

  const ValidationWrapper({
    super.key,
    required this.child,
    required this.componentName,
  });

  @override
  State<ValidationWrapper> createState() => _ValidationWrapperState();
}

class _ValidationWrapperState extends State<ValidationWrapper> {
  bool _isValidated = false;

  @override
  void initState() {
    super.initState();
    _loadValidationState();
  }

  Future<void> _loadValidationState() async {
    final isValidated = await FileValidationService.getComponentValidation(widget.componentName);
    setState(() {
      _isValidated = isValidated;
    });
  }

  void _toggleValidation() async {
    final newState = !_isValidated;
    await FileValidationService.setComponentValidation(widget.componentName, newState);
    setState(() {
      _isValidated = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          right: 0,
          top: 0,
          child: GestureDetector(
            onDoubleTap: _toggleValidation,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _isValidated ? Colors.green : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
