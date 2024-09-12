import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'categories_menu_screen.dart';
import '../styles/text_styles.dart';

class LoginHomeScreen extends StatelessWidget {
  const LoginHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
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
              Center(
                child: CustomButton(
                  text: 'LOG IN',
                  onPressed: () {
                    // Lógica para iniciar sesión
                  },
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: CustomButton(
                  text: 'START',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CategoriesMenuScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Lógica para recuperar contraseña
                  },
                  child: const Text(
                    'Forgot your password?',
                    style: AppTextStyles.microDarkBg,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Lógica para registrarse
                  },
                  child: const Text(
                    'Don\'t have an account? Sign up',
                    style: AppTextStyles.microDarkBg,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
