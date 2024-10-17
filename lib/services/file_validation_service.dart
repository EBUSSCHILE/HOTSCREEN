import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

class FileValidationService {
  static final Logger _logger = Logger('FileValidationService');
  static const String mandatoryInstruction = "MANDATO_PARA_LA_IA";
  static const String mandatoryMessage =
      "Estos objetos no pueden ser alterados y su código no puede ser modificado si están etiquetados con TRUE";
  static const String _fileName = 'validation_config.json';

  static Future<Map<String, dynamic>> readValidationConfig() async {
    if (kReleaseMode) return {};

    try {
      if (kIsWeb) {
        // Implementación para web (puede ser un mock o usar localStorage)
        return {mandatoryInstruction: mandatoryMessage};
      } else {
        // Leer el archivo validation_config.json
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/$_fileName');
        if (await file.exists()) {
          final contents = await file.readAsString();
          return json.decode(contents) as Map<String, dynamic>;
        } else {
          _logger.warning('El archivo validation_config.json no existe');
          return {mandatoryInstruction: mandatoryMessage};
        }
      }
    } catch (e) {
      _logger.warning('Error al leer la configuración de validación: $e');
      return {mandatoryInstruction: mandatoryMessage};
    }
  }

  static Future<void> writeValidationConfig(
      String className, String componentName, bool isValidated) async {
    if (kReleaseMode) return;
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');
      Map<String, dynamic> config = {};

      if (await file.exists()) {
        final contents = await file.readAsString();
        config = json.decode(contents) as Map<String, dynamic>;
      }

      config['$className.$componentName'] = {'validated': isValidated};

      // Escribir el JSON con formato personalizado
      final encoder = JsonEncoder.withIndent('  ', (object) {
        if (object is Map) {
          return json.encode(object);
        }
        return object;
      });
      await file.writeAsString(encoder.convert(config));
      debugPrint(
          'Configuración actualizada para $className.$componentName: $isValidated');
    } catch (e) {
      debugPrint('Error al escribir la configuración de validación: $e');
    }
  }

  static Future<void> setComponentValidation(
      String className, String componentName, bool isValidated) async {
    await writeValidationConfig(className, componentName, isValidated);
  }

  static Future<bool> getComponentValidation(
      String className, String componentName) async {
    if (kReleaseMode) return false;
    try {
      final config = await readValidationConfig();
      final String fullComponentName = "$className.$componentName";
      final componentConfig = config[fullComponentName];
      _logger.info('Configuración para $fullComponentName: $componentConfig');
      return componentConfig is Map<String, dynamic>
          ? componentConfig['validated'] as bool
          : false;
    } catch (e) {
      _logger.warning('Error al obtener la validación del componente: $e');
      return false;
    }
  }

  static Future<String?> getComponentName(
      String className, String componentName) async {
    if (kReleaseMode) return null;
    final config = await readValidationConfig();
    final String fullComponentName = "$className.$componentName";
    final componentConfig = config[fullComponentName];
    return componentConfig is Map<String, dynamic>
        ? componentConfig['name'] as String?
        : null;
  }

  static Future<void> reformatValidationConfig() async {
    if (kReleaseMode) return;
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_fileName');
      
      if (await file.exists()) {
        final contents = await file.readAsString();
        final config = json.decode(contents) as Map<String, dynamic>;
        
        final StringBuffer buffer = StringBuffer();
        buffer.writeln('{');
        
        config.forEach((key, value) {
          if (key == mandatoryInstruction) {
            buffer.writeln('  "$key": "${value.replaceAll('"', '\\"')}",');
          } else {
            buffer.writeln('  "$key": ${json.encode(value)},');
          }
        });
        
        // Eliminar la última coma y cerrar el objeto JSON
        String result = buffer.toString();
        result = '${result.substring(0, result.length - 2)}\n}';
        
        await file.writeAsString(result);
        debugPrint('Archivo de configuración reformateado');
      }
    } catch (e) {
      debugPrint('Error al reformatear el archivo de configuración: $e');
    }
  }
}
