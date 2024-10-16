import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Añadimos esta importación para HapticFeedback
import 'package:logging/logging.dart';
import 'file_validation_service.dart';
import '../constants/validation_constants.dart';  // Importamos las constantes de validación
import 'package:flutter/foundation.dart';

class ValidationService {
  static final Logger _logger = Logger('ValidationService');
  static const String _key = 'validation_config';
  static final Map<String, bool> _validationCache = {};

  static Future<Map<String, bool>> readValidationConfig() async {
    if (kReleaseMode) return {};
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString(_key);
      if (jsonString != null && jsonString.isNotEmpty) {
        return Map<String, bool>.from(json.decode(jsonString));
      }
      _logger.info('Archivo de configuración vacío o no existente');
      return {};
    } catch (e) {
      _logger.warning('Error al leer la configuración de validación: $e');
      return {};
    }
  }

  static Future<void> writeValidationConfig(Map<String, bool> config) async {
    if (kReleaseMode) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, json.encode(config));
      _logger.info('Configuración actualizada');
    } catch (e) {
      _logger.warning('Error al escribir la configuración de validación: $e');
    }
  }

  static Future<void> setComponentValidation(
      String className, String componentName, bool isValidated) async {
    if (kReleaseMode) return;
    await FileValidationService.writeValidationConfig(
        className, componentName, isValidated);
  }

  static Future<bool> getComponentValidation(
      String className, String componentName) async {
    if (kReleaseMode) return false;
    
    final fullComponentName = "$className.$componentName";
    if (_validationCache.containsKey(fullComponentName)) {
      return _validationCache[fullComponentName]!;
    }
    
    final config = await FileValidationService.readValidationConfig();
    final componentConfig = config[fullComponentName];
    final isValidated = componentConfig is Map<String, dynamic> ? componentConfig['validated'] as bool : false;
    _validationCache[fullComponentName] = isValidated;
    
    if (!kReleaseMode) {
      _logger.info('Validación de $fullComponentName: $isValidated');
    }
    return isValidated;
  }

  static Widget buildValidationRing(String className, String componentName) {
    if (kReleaseMode) return const SizedBox.shrink();
    
    return _CachedValidationRing(
      className: className,
      componentName: componentName,
    );
  }

  static Future<List<String>> getValidationRoutines() async {
    if (kReleaseMode) return [];
    final List<String> protectedClasses = [
      'ValidationService',
      'FileValidationService',
      'AuthService',
      'ClaudeService',
      'NavigationService',
      'LocalizationService',
      'ThemeService',
      'ApiService',
      'DatabaseService',
      'LoggingService',
      'ChatPage'
    ];

    try {
      final config = await FileValidationService.readValidationConfig();
      _logger.info('Config leída: $config');
      return protectedClasses;
    } catch (e) {
      _logger.warning('Error al obtener las rutinas de validación: $e');
      return protectedClasses;
    }
  }

  static Future<bool> canModifyComponent(String className, String componentName) async {
    if (kReleaseMode) return true;
    final isValidated = await getComponentValidation(className, componentName);
    if (isValidated) {
      _logger.warning('$mandatoryInstruction: Intento de modificar $className.$componentName');
    }
    return !isValidated;
  }
}

class _CachedValidationRing extends StatefulWidget {
  final String className;
  final String componentName;

  const _CachedValidationRing({
    required this.className,
    required this.componentName,
  });

  @override
  _CachedValidationRingState createState() => _CachedValidationRingState();
}

class _CachedValidationRingState extends State<_CachedValidationRing> {
  late Future<bool> _validationFuture;

  @override
  void initState() {
    super.initState();
    _validationFuture = ValidationService.getComponentValidation(
      widget.className,
      widget.componentName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _validationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        final isValidated = snapshot.data ?? false;
        return _ValidationRing(
          className: widget.className,
          componentName: widget.componentName,
          initialValidationState: isValidated,
        );
      },
    );
  }
}

class _ValidationRing extends StatefulWidget {
  final String className;
  final String componentName;
  final bool initialValidationState;

  const _ValidationRing({
    required this.className,
    required this.componentName,
    required this.initialValidationState,
  });

  @override
  _ValidationRingState createState() => _ValidationRingState();
}

class _ValidationRingState extends State<_ValidationRing> {
  late bool _isValidated;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _isValidated = widget.initialValidationState;
    _checkValidation(); // Llamamos a _checkValidation al inicializar el estado
  }

  Future<void> _checkValidation() async {
    final isValidated = await ValidationService.getComponentValidation(
      widget.className,
      widget.componentName,
    );
    if (mounted) {
      setState(() {
        _isValidated = isValidated;
      });
    }
  }

  Future<void> _toggleValidation() async {
    final newValidationState = !_isValidated;
    await ValidationService.setComponentValidation(
      widget.className,
      widget.componentName,
      newValidationState,
    );
    if (mounted) {
      setState(() {
        _isValidated = newValidationState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return const SizedBox.shrink();
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
                  ? const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 1)
                    ]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
