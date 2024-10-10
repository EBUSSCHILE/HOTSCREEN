import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<void> setComponentValidation(String componentName, bool isValidated) async {
    final config = await readValidationConfig();
    config[componentName] = isValidated;
    await writeValidationConfig(config);
  }

  static Future<bool> getComponentValidation(String componentName) async {
    final config = await readValidationConfig();
    return config[componentName] ?? false;
  }
}
