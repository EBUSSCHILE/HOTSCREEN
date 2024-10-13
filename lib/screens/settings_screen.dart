import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../constants/app_constants.dart';
import '../widgets/app_background.dart';
import '../widgets/settings_button.dart';
import '../widgets/settings_item.dart';
import '../styles/custom_app_bar.dart'; // Cambiado de standard_app_bar.dart a custom_app_bar.dart
import 'validations_screen.dart'; // Importamos la nueva pantalla

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key}) {
    _logger = Logger('SettingsScreen');
  }

  late final Logger _logger;

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: AppConstants.backgroundColor,
        appBar: const CustomAppBar( // Cambiado de StandardAppBar a CustomAppBar
          title: 'Configuración',
          showBackButton: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          children: [
            _buildThemeToggle(),
            const SizedBox(height: 20),
            _buildNotificationSettings(context),
            const SizedBox(height: 20),
            _buildPrivacySettings(context),
            const SizedBox(height: 20),
            _buildValidationsSettings(context), // Agregamos la nueva opción
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle() {
    return SettingsItem(
      title: 'Tema Oscuro',
      trailing: SettingsButton(
        isOn: false,
        onChanged: _handleThemeChange,
      ),
    );
  }

  Widget _buildNotificationSettings(BuildContext context) {
    return SettingsItem(
      title: 'Notificaciones',
      trailing: const Icon(Icons.arrow_forward_ios, color: AppConstants.standardTextColor),
      onTap: () {
        _logger.info('Navegando a configuración de notificaciones');
      },
    );
  }

  Widget _buildPrivacySettings(BuildContext context) {
    return SettingsItem(
      title: 'Privacidad',
      trailing: const Icon(Icons.arrow_forward_ios, color: AppConstants.standardTextColor),
      onTap: () {
        _logger.info('Navegando a configuración de privacidad');
      },
    );
  }

  Widget _buildValidationsSettings(BuildContext context) {
    return SettingsItem(
      title: 'Validaciones',
      trailing: const Icon(Icons.arrow_forward_ios, color: AppConstants.standardTextColor),
      onTap: () {
        _logger.info('Navegando a la pantalla de validaciones');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ValidationsScreen()),
        );
      },
    );
  }

  void _handleThemeChange(bool value) {
    _logger.info('Cambio de tema: $value');
  }
}
