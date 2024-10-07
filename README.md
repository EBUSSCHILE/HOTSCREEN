# HotScreen

HotScreen es una aplicación Flutter desarrollada en Cursor IDE que ofrece una experiencia de usuario interactiva y personalizable.

## Estructura del Proyecto

```
[HotScreen App]
|
+-- [main.dart]
    |
    +-- [LoginScreen] (login_screen.dart)
        |
        +-- [CategoriesMenu] (categories_menu_screen.dart)
        |   |
        |   +-- [Category01] (category_screen_01.dart)
        |   +-- [Category02] (category_02.dart)
        |   +-- [Category03] (category_03.dart)
        |
        +-- [ChatPage] (chat_page.dart)
        |   |
        |   +-- [ClaudeService] (claude_service.dart)
        |
        +-- [UserProfileScreen] (user_profile_screen.dart)
        |
        +-- [SettingsScreen] (settings_screen.dart)
        |   |
        |   +-- [ThemeProvider] (theme_provider.dart)
        |
        +-- [HelpScreen] (help_screen.dart)

## Características Principales

- **Autenticación**: Implementada en `LoginScreen`.
- **Menú de Categorías**: Acceso a diferentes secciones de la aplicación.
- **Chat Integrado**: Utilizando `ClaudeService` para interacciones de IA.
- **Perfil de Usuario**: Gestión de información personal.
- **Configuraciones**: Personalización de la aplicación, incluyendo temas.
- **Ayuda**: Sección de soporte para usuarios.

## Componentes Reutilizables

### Widgets Compartidos

- `AppBackground`: Fondo de aplicación personalizable.
- `BackgroundWrapper`: Envoltorio para fondos consistentes.
- `BaseScreen`: Plantilla base para pantallas.
- `CustomAppBar`: Barra de aplicación personalizada.
- `CustomButton`: Botones estandarizados (ver detalles abajo).
- `CustomTextField`: Campos de texto personalizados.
- `ScreenWrapper`: Envoltorio para estructura de pantalla consistente.
- `UserIconButton`: Botón de icono de usuario.

### Estandarización de Botones

Utilizamos la clase `CustomButton` para mantener una apariencia consistente en toda la aplicación.

#### Tipos y Tamaños Disponibles

- **Tipos:** `ButtonType.primary`, `ButtonType.secondary`
- **Tamaños:** `gigagiant`, `tooBig`, `big`, `medium`, `small`, `micro`, `nano`

#### Beneficios

- Consistencia visual
- Reusabilidad
- Fácil mantenimiento

## Configuración

- `AppConfig`: Configuraciones globales de la aplicación.
- `AppTheme`: Temas y estilos de la aplicación.
- `FirebaseOptions`: Configuración para integración con Firebase.

## Desarrollo

### Ambiente de Desarrollo

- **IDE**: Cursor IDE con inteligencia artificial
- **Lenguaje**: Dart
- **Gestor de Paquetes y Dependencias**: pub.dev

### Estructura de Directorios

```
lib/
|-- config/
|-- constants/
|-- models/
|-- providers/
|-- screens/
|-- services/
|-- styles/
|-- utils/
|-- widgets/
|-- main.dart
```

## Comenzando

Para comenzar con este proyecto:

1. Asegúrate de tener Flutter instalado en tu sistema.
2. Clona este repositorio.
3. Ejecuta `flutter pub get` para instalar las dependencias.
4. Abre el proyecto en Cursor IDE.
5. Ejecuta la aplicación con `flutter run`.

## Recursos Adicionales

- [Documentación de Flutter](https://docs.flutter.dev/)
- [Laboratorio: Escribe tu primera app de Flutter](https://docs.flutter.dev/get-started/codelab)
- [Recetario: Ejemplos útiles de Flutter](https://docs.flutter.dev/cookbook)

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue para discutir cambios mayores antes de enviar un pull request.

## Licencia

[Incluir información de licencia aquí]

## Iconos de la Aplicación

- Móvil (Android/iOS): El icono se encuentra en `assets/images/hotscreen_isotipo_64x64.png`.
- Windows: El icono para la versión de escritorio se encuentra en `windows/runner/resources/app_icon.ico`. Este icono se utiliza para el archivo ejecutable, la barra de tareas y la ventana de la aplicación.

Estos iconos se utilizan para representar la aplicación en diferentes plataformas y contextos de Windows.
