# HotScreen

HotScreen es una aplicación Flutter desarrollada en Cursor IDE que ofrece una experiencia de usuario interactiva y personalizable para el aprendizaje de idiomas en línea. Esta aplicación es un experimento de desarrollo 100% realizado con Inteligencia Artificial, donde el arquitecto humano actúa como guía y supervisor.

## Versión Actual
v1.1.4 - Adición de la pantalla de Karaoke y mejoras en la estructura del proyecto.

## Características Principales
- Interfaz de usuario personalizable
- Sistema de validación de componentes
- Navegación intuitiva entre pantallas
- Diseño responsivo y adaptable
- Aprendizaje de idiomas interactivo
- Función de Karaoke

## Estructura del Proyecto

lib/
├── config/
│ └── app_config.dart
├── constants/
│ └── app_constants.dart
├── screens/
│ ├── login_screen.dart
│ ├── categories_menu_screen.dart
│ ├── karaoke_screen.dart
│ └── help_screen.dart
├── services/
│ └── file_validation_service.dart
├── styles/
│ ├── app_styles.dart
│ ├── custom_app_bar_with_user.dart
│ └── custom_app_bar_with_user_and_title.dart
├── widgets/
│ ├── custom_app_bar.dart
│ ├── custom_button.dart
│ ├── custom_text_field.dart
│ ├── user_icon.dart
│ ├── user_icon_button.dart
│ └── validation_wrapper.dart
├── index.dart
└── main.dart

## Componentes Clave
- **FileValidationService**: Gestiona la validación de componentes.
- **ValidationWrapper**: Envuelve los widgets para la validación visual.
- **CustomAppBar**: Barra de aplicación personalizada con UserIcon.
- **CustomButton**: Botón personalizado con estilos consistentes.
- **LoginScreen**: Pantalla de inicio de sesión.
- **CategoriesMenuScreen**: Muestra las categorías de aprendizaje.
- **HelpScreen**: Proporciona ayuda y soporte al usuario.
- **KaraokeScreen**: Pantalla de Karaoke interactiva.

## Desarrollo y Contribución
Este proyecto es un experimento de IA, pero las contribuciones son bienvenidas. Si deseas contribuir:
1. Haz un fork del repositorio.
2. Crea una nueva rama para tu feature.
3. Realiza tus cambios y asegúrate de que los tests pasen.
4. Envía un pull request con una descripción detallada de tus cambios.

## Instalación
1. Asegúrate de tener Flutter instalado en tu sistema.
2. Clona este repositorio.
3. Ejecuta `flutter pub get` para instalar las dependencias.
4. Usa `flutter run` para iniciar la aplicación en modo de desarrollo.

## Licencia
[Incluir información de licencia aquí]

## Contacto
Para cualquier consulta o sugerencia, por favor abre un issue en este repositorio.

---

Desarrollado con 🧠 por IA y supervisado por humanos.
