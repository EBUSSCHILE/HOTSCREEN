import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/custom_button.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBarWithUserAndTitle(
          title: 'User Profile',
          showBackButton: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.blue),
              ),
              const SizedBox(height: 20),
              const Text(
                'Username',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'user@example.com',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Edit Profile',
                onPressed: () {
                  // Lógica para editar perfil
                },
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: 'Change Password',
                onPressed: () {
                  // Lógica para cambiar contraseña
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
