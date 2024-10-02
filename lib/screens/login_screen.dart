import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart' as app_widgets;
import 'categories_menu_screen.dart';
import '../styles/text_styles.dart';
import '../constants/home_leyend.dart';

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
                        const app_widgets.CustomTextField(
                          hintText: 'Username',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        const app_widgets.CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 30),
                        app_widgets.CustomButton(
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
        style: AppTextStyles.tooBig.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      )).toList(),
    );
  }

  Widget _buildLogo(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double logoWidth;

    // Ajustamos el tamaño del logo según el ancho de la pantalla
    if (screenWidth > 1200) {
      // Para pantallas muy anchas (escritorio maximizado)
      logoWidth = screenWidth * 0.3; // 30% del ancho de la pantalla
    } else if (screenWidth > 600) {
      // Para tablets y pantallas medianas
      logoWidth = screenWidth * 0.4; // 40% del ancho de la pantalla
    } else {
      // Para móviles y pantallas pequeñas
      logoWidth = screenWidth * 0.6; // 60% del ancho de la pantalla
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: logoWidth,
        maxHeight: logoWidth * 0.3, // Ajusta este valor según la relación de aspecto de tu logo
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
      child: const Text('¿Olvidaste tu contraseña?'),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Implementar lógica para "Registrarse"
      },
      child: const Text('¿No tienes una cuenta? Regístrate'),
    );
  }
}
