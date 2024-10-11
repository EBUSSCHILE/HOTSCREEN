import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class FileValidationService {
  static const String filePath = r'C:\Users\T002\Documents\validation_config.json';
  static const String mandatoryInstruction = "MANDATO_PARA_LA_IA";
  static const String mandatoryMessage = "Estos objetos no pueden ser alterados y su código no puede ser modificado si están etiquetados con TRUE";

  static File get _localFile => File(filePath);

  static Future<void> writeValidationConfig(String className, String componentName, bool isValidated, [String? name]) async {
    try {
      final file = _localFile;
      Map<String, dynamic> currentConfig = await readValidationConfig();

      if (!currentConfig.containsKey(mandatoryInstruction)) {
        currentConfig = {mandatoryInstruction: mandatoryMessage, ...currentConfig};
      }

      final String fullComponentName = "$className.$componentName";
      
      currentConfig[fullComponentName] = {
        'name': name ?? componentName,
        'validated': isValidated
      };

      final formattedJsonString = _formatJson(currentConfig);
      await file.writeAsString(formattedJsonString);
      debugPrint('Configuración actualizada en $filePath');
      debugPrint('Contenido escrito: $formattedJsonString');
    } catch (e) {
      debugPrint('Error al escribir la configuración de validación: $e');
    }
  }

  static String _formatJson(Map<String, dynamic> json) {
    final buffer = StringBuffer();
    buffer.writeln('{');
    json.forEach((key, value) {
      if (key == mandatoryInstruction) {
        buffer.writeln('  "$key": "${value.replaceAll('"', '\\"')}",');
      } else {
        final valueString = jsonEncode(value);
        buffer.writeln('  "$key": $valueString,');
      }
    });
    String result = buffer.toString().trimRight();
    if (result.endsWith(',')) {
      result = result.substring(0, result.length - 1);
    }
    result += '\n}';
    return result;
  }

  static Future<Map<String, dynamic>> readValidationConfig() async {
    try {
      final file = _localFile;
      if (!await file.exists()) {
        debugPrint('El archivo de configuración no existe');
        return {};
      }
      final contents = await file.readAsString();
      debugPrint('Contenido del archivo: $contents');
      return json.decode(contents) as Map<String, dynamic>;
    } catch (e) {
      debugPrint('Error al leer la configuración de validación: $e');
      return {};
    }
  }

  static Future<void> setComponentValidation(String className, String componentName, bool isValidated) async {
    await writeValidationConfig(className, componentName, isValidated);
  }

  static Future<bool> getComponentValidation(String className, String componentName) async {
    try {
      final config = await readValidationConfig();
      final String fullComponentName = "$className.$componentName";
      final componentConfig = config[fullComponentName];
      debugPrint('Configuración para $fullComponentName: $componentConfig');
      return componentConfig is Map<String, dynamic> ? componentConfig['validated'] as bool : false;
    } catch (e) {
      debugPrint('Error al obtener la validación del componente: $e');
      return false;
    }
  }

  static Future<String?> getComponentName(String className, String componentName) async {
    final config = await readValidationConfig();
    final String fullComponentName = "$className.$componentName";
    final componentConfig = config[fullComponentName];
    return componentConfig is Map<String, dynamic> ? componentConfig['name'] as String? : null;
  }
}
