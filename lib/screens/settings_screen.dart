import 'package:flutter/material.dart';
import '../widgets/standard_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(
        title: 'Configuración',
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notificaciones'),
            trailing: Switch(
              value: true, // Esto debería ser un valor del estado de la app
              onChanged: (bool value) {
                // Lógica para cambiar las notificaciones
              },
            ),
          ),
          ListTile(
            title: const Text('Tema Oscuro'),
            trailing: Switch(
              value: false, // Esto debería ser un valor del estado de la app
              onChanged: (bool value) {
                // Lógica para cambiar el tema
              },
            ),
          ),
          // ... Más opciones de configuración
        ],
      ),
    );
  }
}
