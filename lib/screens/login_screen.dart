import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/validation_ring.dart';
import '../constants/app_constants.dart';
import 'categories_menu_screen.dart'; // Importamos la pantalla de categorías

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false; // Cambiado a final

  void _handleLogin() {
    // Aquí iría la lógica de autenticación
    // Por ahora, simplemente navegamos a la pantalla de categorías
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CategoriesMenuScreen(categories: ['Categoría 1', 'Categoría 2', 'Categoría 3']),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double fieldWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Stack(
                  children: [
                    Container(
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
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: ValidationRing(
                        className: 'LoginScreen',
                        componentName: 'HeaderText',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/hotscreen_sinfondo.png',
                      height: 100,
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: ValidationRing(
                        className: 'LoginScreen',
                        componentName: 'AppLogo',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Stack(
                  children: [
                    SizedBox(
                      width: fieldWidth,
                      child: CustomTextField(
                        controller: _usernameController,
                        hintText: 'Usuario',
                        icon: Icons.person,
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: ValidationRing(
                        className: 'LoginScreen',
                        componentName: 'UsernameField',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    SizedBox(
                      width: fieldWidth,
                      child: CustomTextField(
                        controller: _passwordController,
                        hintText: 'Contraseña',
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: ValidationRing(
                        className: 'LoginScreen',
                        componentName: 'PasswordField',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Stack(
                  children: [
                    SizedBox(
                      width: fieldWidth,
                      child: CustomButton(
                        text: _isLoading ? 'Cargando...' : 'LOG IN',
                        onPressed: _isLoading ? null : _handleLogin,
                        backgroundColor: const Color(0xFFB71C1C), // Rojo oscuro constante
                        textColor: Colors.white, // Texto blanco
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: ValidationRing(
                        className: 'LoginScreen',
                        componentName: 'LoginButton',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Implementar lógica para recuperar contraseña
                      },
                      child: const Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: ValidationRing(
                        className: 'LoginScreen',
                        componentName: 'ForgotPasswordButton',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Implementar lógica para registrarse
                      },
                      child: const Text(
                        '¿No tienes una cuenta? Regístrate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: ValidationRing(
                        className: 'LoginScreen',
                        componentName: 'RegisterButton',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: ValidationRing(
              className: 'LoginScreen',
              componentName: 'Body',
            ),
          ),
        ],
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
