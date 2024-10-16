import 'dart:io';
import 'package:flutter/foundation.dart';

String getAppVersion() {
  try {
    final file = File('README.md');
    final contents = file.readAsStringSync();
    final versionLine = contents.split('\n').firstWhere(
      (line) => line.trim().startsWith('##Current Version'),
      orElse: () => '',
    );
    if (versionLine.isNotEmpty) {
      final nextLine = contents.split('\n')[contents.split('\n').indexOf(versionLine) + 1];
      return nextLine.trim().substring(0, 6);
    }
  } catch (e) {
    // Usamos debugPrint solo en modo de desarrollo
    if (kDebugMode) {
      debugPrint('Error al leer la versión: $e');
    }
  }
  return 'v0.0.0'; // Versión por defecto si no se puede leer
}
