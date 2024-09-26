// import 'package:logging/logging.dart';

// class AuthService {
//   static final _logger = Logger('AuthService');

//   static Future<void> logout() async {
//     // Implementa aquí la lógica de cierre de sesión
//     await Future.delayed(const Duration(seconds: 1)); // Simulación de operación asíncrona
//     _logger.info('Usuario ha cerrado sesión');
//   }

//   // Método para configurar el logging (llama a esto en la inicialización de tu app)
//   static void setupLogging() {
//     Logger.root.level = Level.ALL; // Ajusta esto según tus necesidades
//     Logger.root.onRecord.listen((record) {
//       // En producción, podrías querer enviar esto a un servicio de logging
//       // Por ahora, lo imprimimos en la consola
//       print('${record.level.name}: ${record.time}: ${record.message}');
//     });
//   }
// }
