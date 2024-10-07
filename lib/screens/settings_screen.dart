import 'package:flutter/material.dart';
import '../widgets/standard_app_bar.dart';
import '../constants/app_constants.dart';
import '../widgets/app_background.dart';
import '../widgets/settings_button.dart';
import '../widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: AppConstants.backgroundColor,
        appBar: const StandardAppBar(
          title: 'Configuración',
          showBackButton: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          children: [
            SettingsItem(
              title: 'Notificaciones',
              trailing: SettingsButton(
                isOn: true,
                onChanged: (bool value) {
                  // Lógica para cambiar las notificaciones
                },
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            SettingsItem(
              title: 'Tema Oscuro',
              trailing: SettingsButton(
                isOn: false,
                onChanged: (bool value) {
                  // Lógica para cambiar el tema
                },
              ),
            ),
            // ... Más opciones de configuración
          ],
        ),
      ),
    );
  }
}
