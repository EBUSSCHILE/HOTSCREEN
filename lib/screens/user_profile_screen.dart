import 'package:flutter/material.dart';
import '../widgets/standard_app_bar.dart';
import '../constants/app_constants.dart';
import '../widgets/app_background.dart';
import '../widgets/full_screen_image_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: AppConstants.backgroundColor, // Cambiado a backgroundColor
        appBar: const StandardAppBar(
          title: 'Perfil de Usuario',
          showBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onDoubleTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FullScreenImageView(imageAsset: 'assets/images/default_avatar.png'),
                  ));
                },
                child: Hero(
                  tag: 'profileImage',
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: AppConstants.primaryColor,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/default_avatar.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nombre de Usuario',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.standardTextColor,
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoRow(Icons.email, 'Correo electrónico', 'usuario@ejemplo.com'),
              _buildInfoRow(Icons.phone, 'Teléfono', '+1234567890'),
              _buildInfoRow(Icons.location_on, 'Ubicación', 'Ciudad, País'),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Lógica para editar perfil
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  foregroundColor: AppConstants.buttonTextColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Editar Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppConstants.standardTextColor),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: AppConstants.standardTextColor.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: AppConstants.standardTextColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
