import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'categories_menu_screen.dart';
import '../constants/home_leyend.dart';
import '../constants/app_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                        _buildLogo(context),
                        const SizedBox(height: 40),
                        const CustomTextField(
                          hintText: 'Username',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        const CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          texto: 'LOG IN',
                          onPressed: () => _navigateToCategoriesMenu(context),
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                        const SizedBox(height: 20),
                        _buildForgotPasswordButton(context),
                        const SizedBox(height: 20),
                        _buildSignUpButton(context),
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
      children: HomeLeyend.loginHeaderTexts.map((text) => Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppConstants.standardTextColor,
        ),
        textAlign: TextAlign.center,
      )).toList(),
    );
  }

  Widget _buildLogo(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double logoWidth;

    if (screenWidth > 1200) {
      logoWidth = screenWidth * 0.3;
    } else if (screenWidth > 600) {
      logoWidth = screenWidth * 0.4;
    } else {
      logoWidth = screenWidth * 0.6;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: logoWidth,
        maxHeight: logoWidth * 0.3,
      ),
      child: Image.asset(
        'assets/images/hotscreen_sinfondo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  void _navigateToCategoriesMenu(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CategoriesMenuScreen(),
      ),
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Implementar lógica para "Olvidé mi contraseña"
      },
      child: const Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(color: AppConstants.standardTextColor),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Implementar lógica para "Registrarse"
      },
      child: const Text(
        '¿No tienes una cuenta? Regístrate',
        style: TextStyle(color: AppConstants.standardTextColor),
      ),
    );
  }
}
