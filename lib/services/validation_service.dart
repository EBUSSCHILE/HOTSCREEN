import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Añadimos esta importación para HapticFeedback
import 'file_validation_service.dart';

class ValidationService {
  static const String _key = 'validation_config';

  static Future<Map<String, bool>> readValidationConfig() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString(_key);
      if (jsonString != null) {
        return Map<String, bool>.from(json.decode(jsonString));
      }
      return {};
    } catch (e) {
      debugPrint('Error al leer la configuración de validación: $e');
      return {};
    }
  }

  static Future<void> writeValidationConfig(Map<String, bool> config) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, json.encode(config));
      debugPrint('Configuración actualizada');
    } catch (e) {
      debugPrint('Error al escribir la configuración de validación: $e');
    }
  }

  static Future<void> setComponentValidation(String className, String componentName, bool isValidated) async {
    final config = await readValidationConfig();
    final fullComponentName = "$className.$componentName";
    config[fullComponentName] = isValidated;
    await writeValidationConfig(config);
    await FileValidationService.setComponentValidation(className, componentName, isValidated);
  }

  static Future<bool> getComponentValidation(String className, String componentName) async {
    final config = await readValidationConfig();
    final fullComponentName = "$className.$componentName";
    return config[fullComponentName] ?? false;
  }

  static Widget buildValidationRing(String className, String componentName) {
    return _ValidationRing(
      className: className,
      componentName: componentName,
    );
  }
}

class _ValidationRing extends StatefulWidget {
  final String className;
  final String componentName;

  const _ValidationRing({
    required this.className,
    required this.componentName,
  });

  @override
  _ValidationRingState createState() => _ValidationRingState();
}

class _ValidationRingState extends State<_ValidationRing> {
  bool _isValidated = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _checkValidation();
  }

  Future<void> _checkValidation() async {
    final isValidated = await ValidationService.getComponentValidation(
      widget.className,
      widget.componentName,
    );
    setState(() {
      _isValidated = isValidated;
    });
  }

  Future<void> _toggleValidation() async {
    final newValidationState = !_isValidated;
    await ValidationService.setComponentValidation(
      widget.className,
      widget.componentName,
      newValidationState,
    );
    setState(() {
      _isValidated = newValidationState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onDoubleTap: () {
        _toggleValidation();
        HapticFeedback.mediumImpact();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: _isPressed ? 24 : 20,
            height: _isPressed ? 24 : 20,
            decoration: BoxDecoration(
              color: _isValidated ? Colors.green : Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: _isPressed
                  ? const [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 1)]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
