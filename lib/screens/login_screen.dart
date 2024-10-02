import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart' as app_widgets;
import 'categories_menu_screen.dart';
import '../styles/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/home_leyend.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Eliminar completamente el AppBar
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,  // Asegura que el Stack ocupe todo el espacio disponible
        children: [
          // Fondo con imagen SVG
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...HomeLeyend.loginHeaderTexts.map((text) => Text(
                      text,
                      style: AppTextStyles.tooBig.copyWith(color: Colors.white),
                    )),
                    const SizedBox(height: 40),
                    Center(
                      child: Image.asset(
                        'assets/images/hotscreen_logo_300x89.png',
                        width: 200,
                      ),
                    ),
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CategoriesMenuScreen(),
                          ),
                        );
                      },
                      width: MediaQuery.of(context).size.width * 0.8,
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
