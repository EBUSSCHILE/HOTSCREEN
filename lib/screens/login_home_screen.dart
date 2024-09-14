import 'package:flutter/material.dart';
import '../styles/text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'categories_menu_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginHomeScreen extends StatelessWidget {
  const LoginHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,  // Asegura que el Stack ocupe todo el espacio disponible
        children: [
          // Fondo
          SvgPicture.asset(
            'assets/images/background_pattern.svg',
            fit: BoxFit.cover,  // Ajusta la imagen para cubrir todo el espacio
            width: double.infinity,
            height: double.infinity,
          ),
          // Contenido principal movido hacia abajo
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Easy and quick\nLearn Language\nonline!',
                      style: AppTextStyles.tooBig.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Image.asset(
                        'assets/images/hotscreen_logo_300x89.png',
                        width: 200,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const CustomTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    const CustomTextField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      texto: 'LOG IN',
                      onPressed: () {
                        // Lógica para iniciar sesión
                      },
                      tamano: ButtonSize.medium,
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      texto: 'START',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CategoriesMenuScreen(),
                          ),
                        );
                      },
                      tamano: ButtonSize.medium,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Lógica para recuperar contraseña
                      },
                      child: Text(
                        'Forgot your password?',
                        style: AppTextStyles.microDarkBg.copyWith(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Lógica para registrarse
                      },
                      child: Text(
                        'Don\'t have an account? Sign up',
                        style: AppTextStyles.microDarkBg.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
