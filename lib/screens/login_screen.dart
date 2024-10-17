import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../services/validation_service.dart';
import '../constants/app_constants.dart';
import '../utils/version_utils.dart';
import 'categories_menu_screen.dart'; // Añadimos esta importación

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Definimos una lista de categorías de ejemplo
  final List<String> categories = ['Unidad 1', 'Unidad 2', 'Unidad 3'];

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
                          text: 'LOG IN',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoriesMenuScreen(categories: categories),
                              ),
                            );
                          },
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
                          // Implementar nueva lógica para recuperar contraseña
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Recuperar Contraseña'),
                                content: const Text('Se enviará un correo con instrucciones para recuperar tu contraseña.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancelar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Enviar'),
                                    onPressed: () {
                                      // Aquí iría la lógica para enviar el correo de recuperación
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Correo enviado. Revisa tu bandeja de entrada.')),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
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
          Positioned(
            right: 10,
            bottom: 10,
            child: Text(
              getAppVersion(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
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
