import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              texto: 'LOG IN',
              onPressed: () {
                // Implementa la lógica de inicio de sesión aquí
              },
              width: 250.0,
            ),
            const SizedBox(height: 10),
            CustomButton(
              texto: 'REGISTER',
              onPressed: () {
                // Implementa la lógica de registro aquí
              },
              width: 250.0,
            ),
            const SizedBox(height: 10),
            CustomButton(
              texto: 'FORGOT PASSWORD',
              onPressed: () {
                // Implementa la lógica de recuperación de contraseña aquí
              },
              width: 250.0,
            ),
          ],
        ),
      ),
    );
  }
}

// Aquí puedes agregar otras clases si las necesitas

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
