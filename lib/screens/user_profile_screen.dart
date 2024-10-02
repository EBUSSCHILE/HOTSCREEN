import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_with_user_and_title.dart';
import '../widgets/app_widgets.dart' as app_widgets;

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithUserAndTitle(
        title: 'Perfil de Usuario',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/default_avatar.png'),
                  // Reemplaza con la imagen de perfil del usuario si está disponible
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Nombre de Usuario',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildInfoItem(Icons.email, 'Correo electrónico', 'usuario@ejemplo.com'),
              _buildInfoItem(Icons.phone, 'Teléfono', '+1234567890'),
              _buildInfoItem(Icons.location_on, 'Ubicación', 'Ciudad, País'),
              const SizedBox(height: 30),
              Center(
                child: app_widgets.CustomButton(
                  texto: 'Editar Perfil',
                  onPressed: () {
                    // Lógica para editar perfil
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
