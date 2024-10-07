import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../constants/home_leyend.dart';
import '../widgets/app_logo.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/text_button.dart';
import '../config/routes.dart';
import '../utils/error_handler.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        _buildHeaderText(),
                        const SizedBox(height: 40),
                        const AppLogo(),
                        const SizedBox(height: 40),
                        CustomTextField(
                          hintText: 'Username',
                          icon: Icons.person,
                          controller: _usernameController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          isPassword: true,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 30),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                text: 'LOG IN',
                                onPressed: _handleLogin,
                                size: ButtonSize.large,
                              ),
                        const SizedBox(height: 20),
                        CustomTextButton(
                          text: '¿Olvidaste tu contraseña?',
                          onPressed: () {
                            // Implementar lógica para "Olvidé mi contraseña"
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextButton(
                          text: '¿No tienes una cuenta? Regístrate',
                          onPressed: () {
                            // Implementar lógica para "Registrarse"
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      children: HomeLeyend.loginHeaderTexts
          .map((text) => Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.standardTextColor,
                ),
                textAlign: TextAlign.center,
              ))
          .toList(),
    );
  }

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Usamos Provider.of con listen: false para evitar reconstrucciones innecesarias
      final authService = Provider.of<AuthService>(context, listen: false);
      final success = await authService.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (mounted) {
        if (success) {
          // Navegamos directamente a la pantalla de categorías
          Navigator.of(context).pushReplacementNamed(Routes.categoriesMenu);
        } else {
          ErrorHandler.showErrorDialog(
            context,
            'Credenciales inválidas. Por favor, intenta de nuevo.',
          );
        }
      }
    } catch (e, stack) {
      ErrorHandler.logError('Error durante el inicio de sesión', e, stack);
      if (mounted) {
        ErrorHandler.showErrorDialog(
          context,
          'Ocurrió un error durante el inicio de sesión. Por favor, intenta de nuevo.',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
