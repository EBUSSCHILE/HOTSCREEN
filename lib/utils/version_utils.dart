import 'dart:io';
import 'package:flutter/foundation.dart';

String getAppVersion() {
  try {
    final file = File('README.md');
    final firstLine = file.readAsLinesSync().first;
    final versionMatch = RegExp(r'v\d+\.\d+\.\d+').firstMatch(firstLine);
    if (versionMatch != null) {
      return versionMatch.group(0)!;
    }
  } catch (e) {
    if (kDebugMode) {
      debugPrint('Error al leer la versión: $e');
    }
  }
  return 'v0.0.0'; // Versión por defecto si no se puede leer
}
