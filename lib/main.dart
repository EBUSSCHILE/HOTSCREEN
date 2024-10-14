import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'config/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configurar el logger
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      // En modo debug, usamos debugPrint para mostrar logs inmediatamente
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    } else {
      // En modo release, aquí podrías usar un servicio de logging más robusto
      // Por ejemplo, enviar los logs a un servicio remoto
      // logToRemoteService(record);
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}
