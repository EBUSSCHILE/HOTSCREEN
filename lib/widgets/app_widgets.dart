import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
// Elimina esta importación si no se usa
// import '../config/app_config.dart';
import '../screens/settings_screen.dart';
import '../screens/user_profile_screen.dart';
// Elimina esta importación si ya no se usa
// import '../screens/login_home_screen.dart';
// import '../services/auth_service.dart';

// ... otros imports y código ...

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final double width;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.width = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          foregroundColor: AppColors.buttonTextColor,
        ),
        child: Text(texto),
      ),
    );
  }
}

// Eliminamos la enumeración ButtonSize si no se usa en ninguna parte

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
      },
    );
  }
}

class UserIconButton extends StatelessWidget {
  const UserIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()),
        );
      },
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logout button pressed')),
        );
      },
      child: const Text('Logout'),
    );
  }
}

// ... otras clases y widgets si es necesario ...

// CustomAppBarWithUserAndTitle
class CustomAppBarWithUserAndTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBarWithUserAndTitle({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: const [
        UserIconButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// CustomListTile (si existe)
class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: onTap,
    );
  }
}

// Otros widgets personalizados que puedas tener...

// CustomTextField
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    // Calculamos el 60% del ancho de la pantalla
    final width = MediaQuery.of(context).size.width * 0.6;
    
    return Center(
      child: SizedBox(
        width: width,
        child: TextField(
          obscureText: isPassword,
          style: const TextStyle(color: AppConstants.darkViolet),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppConstants.darkViolet.withOpacity(0.7)),
            prefixIcon: Icon(icon, color: AppConstants.darkViolet),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
              borderSide: BorderSide(color: AppConstants.darkViolet.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
              borderSide: const BorderSide(color: AppConstants.darkViolet),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
        ),
      ),
    );
  }
}

class FloatingMenu extends StatelessWidget {
  final Widget child;

  const FloatingMenu({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 56),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onSelected: (String result) {
        switch (result) {
          case 'profile':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfileScreen()),
            );
            break;
          case 'settings':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
            break;
          case 'logout':
            cerrarSesion(context);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'profile',
          child: Text('Mi perfil', style: TextStyle(color: Colors.white)),
        ),
        const PopupMenuItem<String>(
          value: 'settings',
          child: Text('Configuración', style: TextStyle(color: Colors.white)),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
        ),
      ],
      child: child,
    );
  }

  void cerrarSesion(BuildContext context) {
    // Obtener el AuthService
    // final authService = Provider.of<AuthService>(context, listen: false);
    
    // Cerrar sesión en el servicio de autenticación
    // authService.logout().then((_) {
    //   // Usar un método que no dependa del BuildContext
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    //   });
    // }).catchError((error) {
    //   // Usar un método que no dependa del BuildContext
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Error al cerrar sesión: $error')),
    //     );
    //   });
    // });
  }
}

class SomeWidget extends StatelessWidget {
  const SomeWidget({super.key});  // Usa super.key en lugar de Key? key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Lógica del botón
            },
            child: const Text('Botón'),  // Añade 'const' aquí
          ),
        ],
      ),
    );
  }

  void someMethod() {
    // Lógica del método
  }

  final String someProperty = 'Valor';
}

class ResponsiveLogo extends StatelessWidget {
  final String largeLogo;
  final String smallLogo;
  final double widthFactor;

  const ResponsiveLogo({
    super.key,
    required this.largeLogo,
    required this.smallLogo,
    this.widthFactor = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Image.asset(
      isLargeScreen ? largeLogo : smallLogo,
      width: screenWidth * widthFactor,
      fit: BoxFit.contain,
    );
  }
}