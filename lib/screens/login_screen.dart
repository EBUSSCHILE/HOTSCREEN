import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../services/validation_service.dart';
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
  final bool _isLoading = false;

  void _handleLogin() {
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
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildValidatedWidget(
                      'HeaderText',
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
                    ),
                    const SizedBox(height: 40),
                    _buildValidatedWidget(
                      'AppLogo',
                      Image.asset(
                        'assets/images/hotscreen_sinfondo.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildValidatedWidget(
                      'UsernameField',
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextField(
                          controller: _usernameController,
                          hintText: 'Usuario',
                          icon: Icons.person,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildValidatedWidget(
                      'PasswordField',
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextField(
                          controller: _passwordController,
                          hintText: 'Contraseña',
                          icon: Icons.lock,
                          obscureText: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildValidatedWidget(
                      'LoginButton',
                      SizedBox(
                        width: fieldWidth,
                        child: CustomButton(
                          text: _isLoading ? 'Cargando...' : 'LOG IN',
                          onPressed: _isLoading ? null : _handleLogin,
                          backgroundColor: const Color(0xFFB71C1C),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildValidatedWidget(
                      'ForgotPasswordButton',
                      TextButton(
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
                    _buildValidatedWidget(
                      'RegisterButton',
                      TextButton(
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
          Positioned(
            right: 10,
            top: 10,
            child: ValidationService.buildValidationRing(
              'LoginScreen',
              'LoginScreen',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValidatedWidget(String componentName, Widget child) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          right: -10,
          top: -10,
          child: ValidationService.buildValidationRing('LoginScreen', componentName),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
