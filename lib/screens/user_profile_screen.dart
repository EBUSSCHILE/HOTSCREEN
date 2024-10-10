import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../widgets/app_background.dart';
import '../widgets/custom_button.dart';
import '../widgets/full_screen_image_view.dart';
import '../widgets/info_row.dart';
import '../widgets/standard_app_bar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const StandardAppBar(
          title: 'Perfil de Usuario',
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProfileImage(context),
                const SizedBox(height: 20),
                _buildUserName(),
                const SizedBox(height: 20),
                _buildUserInfo(),
                const SizedBox(height: 30),
                _buildEditProfileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFullScreenImage(context),
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
    );
  }

  void _openFullScreenImage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const FullScreenImageView(imageAsset: 'assets/images/default_avatar.png'),
    ));
  }

  Widget _buildUserName() {
    return const Text(
      'Nombre de Usuario',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppConstants.standardTextColor,
      ),
    );
  }

  Widget _buildUserInfo() {
    return const Column(
      children: [
        InfoRow(icon: Icons.email, label: 'Correo electrónico', value: 'usuario@ejemplo.com'),
        InfoRow(icon: Icons.phone, label: 'Teléfono', value: '+1234567890'),
        InfoRow(icon: Icons.location_on, label: 'Ubicación', value: 'Ciudad, País'),
      ],
    );
  }

  Widget _buildEditProfileButton() {
    return CustomButton(
      text: 'Editar Perfil',
      onPressed: () {
        // Acción del botón
      },
    );
  }
}
