import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class FileValidationService {
  static const String filePath = r'C:\Users\T002\Documents\validation_config.json';
  static const String mandatoryInstruction = "MANDATO_PARA_LA_IA";

  static File get _localFile => File(filePath);

  static Future<void> writeValidationConfig(String componentName, bool isValidated) async {
    try {
      final file = _localFile;
      Map<String, dynamic> currentConfig = await readValidationConfig();

      // Actualizar solo el componente específico
      currentConfig[componentName] = isValidated;

      final buffer = StringBuffer();
      buffer.write('{\n');
      
      currentConfig.forEach((key, value) {
        if (key == mandatoryInstruction) {
          buffer.write('  "$key": "${value.toString().replaceAll('"', '\\"')}",\n');
        } else {
          buffer.write('  "$key": $value,\n');
        }
      });
      
      // Eliminar la última coma y agregar el cierre de llave
      String jsonString = buffer.toString().trimRight();
      jsonString = '${jsonString.substring(0, jsonString.length - 1)}\n}';
      
      await file.writeAsString(jsonString);
      debugPrint('Configuración actualizada en $filePath');
      debugPrint('Contenido escrito: $jsonString');
    } catch (e) {
      debugPrint('Error al escribir la configuración de validación: $e');
    }
  }

  static Future<Map<String, dynamic>> readValidationConfig() async {
    try {
      final file = _localFile;
      final contents = await file.readAsString();
      return json.decode(contents) as Map<String, dynamic>;
    } catch (e) {
      debugPrint('Error al leer la configuración de validación: $e');
      return {mandatoryInstruction: "Estos objetos no pueden ser alterados y su código no puede ser modificado si están etiquetados con TRUE"};
    }
  }

  static Future<void> setComponentValidation(String componentName, bool isValidated) async {
    final config = await readValidationConfig();
    config[componentName] = isValidated;
    await writeValidationConfig(componentName, isValidated);
  }

  static Future<bool> getComponentValidation(String componentName) async {
    final config = await readValidationConfig();
    return config[componentName] ?? false;
  }
}
