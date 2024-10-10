import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/validation_wrapper.dart';
import '../constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: prefer_final_fields
  bool _isLoading = false;

  void _handleLogin() {
    // Implementar lógica de inicio de sesión
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: ValidationWrapper(
        componentName: 'LoginScreen',
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                ValidationWrapper(
                  componentName: 'HeaderText',
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text(
                      'Easy and quick\nLearn Language\nonline!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ValidationWrapper(
                  componentName: 'AppLogo',
                  child: Image.asset(
                    'assets/images/hotscreen_sinfondo.png',
                    height: 100,
                  ),
                ),
                const SizedBox(height: 40),
                ValidationWrapper(
                  componentName: 'UsernameField',
                  child: CustomTextField(
                    controller: _usernameController,
                    hintText: 'Usuario',
                    icon: Icons.person,
                  ),
                ),
                const SizedBox(height: 16),
                ValidationWrapper(
                  componentName: 'PasswordField',
                  child: CustomTextField(
                    controller: _passwordController,
                    hintText: 'Contraseña',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 24),
                ValidationWrapper(
                  componentName: 'LoginButton',
                  child: CustomButton(
                    text: _isLoading ? 'Cargando...' : 'LOG IN',
                    onPressed: _isLoading ? null : _handleLogin,
                  ),
                ),
                const SizedBox(height: 16),
                ValidationWrapper(
                  componentName: 'ForgotPasswordButton',
                  child: TextButton(
                    onPressed: () {
                      // Implementar lógica para recuperar contraseña
                    },
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ValidationWrapper(
                  componentName: 'RegisterButton',
                  child: TextButton(
                    onPressed: () {
                      // Implementar lógica para registrarse
                    },
                    child: const Text(
                      '¿No tienes una cuenta? Regístrate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
