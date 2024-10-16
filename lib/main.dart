import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configurar el logger
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  // Copiar el archivo validation_config.json si no existe
  if (!kIsWeb && !kReleaseMode) {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/validation_config.json');
    if (!await file.exists()) {
      final ByteData data = await rootBundle.load('assets/validation_config.json');
      final List<int> bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes);
    }
  }

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
