import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';

class FileValidationService {
  static final Logger _logger = Logger('FileValidationService');
  static const String _fileName = 'validation_config.json';
  static const String mandatoryInstruction = "MANDATO_PARA_LA_IA";
  static const String mandatoryMessage = "Estos objetos no pueden ser alterados y su código no puede ser modificado si están etiquetados con TRUE";

  static Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  static Future<Map<String, dynamic>> readValidationConfig() async {
    try {
      final file = await _getLocalFile();
      if (!await file.exists()) {
        _logger.info('El archivo de configuración no existe');
        return {mandatoryInstruction: mandatoryMessage};
      }
      final contents = await file.readAsString();
      if (contents.isEmpty) {
        _logger.info('El archivo de configuración está vacío');
        return {mandatoryInstruction: mandatoryMessage};
      }
      _logger.info('Contenido del archivo: $contents');
      return json.decode(contents) as Map<String, dynamic>;
    } catch (e) {
      _logger.warning('Error al leer la configuración de validación: $e');
      return {mandatoryInstruction: mandatoryMessage};
    }
  }

  static Future<void> writeValidationConfig(String className, String componentName, bool isValidated) async {
    try {
      final file = await _getLocalFile();
      Map<String, dynamic> config = await readValidationConfig();
      final String fullComponentName = "$className.$componentName";
      config[fullComponentName] = {'validated': isValidated};
      
      // Escribir el archivo con cada registro en una nueva línea
      final buffer = StringBuffer();
      buffer.writeln('{');
      config.forEach((key, value) {
        if (key == mandatoryInstruction) {
          buffer.writeln('  "$key": "$value",');
        } else {
          buffer.writeln('  "$key": ${json.encode(value)},');
        }
      });
      // Eliminar la última coma
      String content = buffer.toString();
      content = content.substring(0, content.length - 2);
      content += '\n}';
      
      await file.writeAsString(content);
      
      _logger.info('Configuración actualizada para $fullComponentName: $isValidated');
    } catch (e) {
      _logger.warning('Error al escribir la configuración de validación: $e');
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
      _logger.info('Configuración para $fullComponentName: $componentConfig');
      return componentConfig is Map<String, dynamic> ? componentConfig['validated'] as bool : false;
    } catch (e) {
      _logger.warning('Error al obtener la validación del componente: $e');
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
