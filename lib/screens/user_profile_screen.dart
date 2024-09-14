import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/user_icon_button.dart'; // Asegúrate de que este import exista

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF000080), // Azul oscuro personalizado
        actions: const [
          UserIconButton(), // Mantenemos el User Icon en el AppBar
        ],
      ),
      body: Container(
        color: const Color(0xFF000080), // Mismo azul oscuro para el fondo del body
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
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
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 30),
          CustomButton(
            texto: 'Editar Perfil',
            onPressed: () {
              // Lógica para editar perfil
            },
            tamano: ButtonSize.medium,
          ),
          const SizedBox(height: 15),
          CustomButton(
            texto: 'Cambiar Contraseña',
            onPressed: () {
              // Lógica para cambiar contraseña
            },
            tamano: ButtonSize.medium,
          ),
        ],
      ),
    );
  }
}
