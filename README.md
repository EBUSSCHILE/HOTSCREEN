
# HotScreen
=======
# remotdev

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Proyecto: HotScreen
# Pantalla principal: LoginScreen
# Otras notas importantes:
# - El nombre de la clase principal es LoginScreen
# - [Agrega aquí cualquier otra información crucial sobre la estructura del proyecto]
@/
@lib/
@pubspec.yaml
@lib/config/
@lib/providers/
@lib/models/
@lib/services/
@lib/styles/
@lib/utils/
@lib/widgets/
@lib/main.dart
@lib/screens/
@lib/test/
@lib/config/app_config.dart
@lib/config/app_theme.dart
@lib/config/firebase_options.dart
@lib/providers/theme_provider.dart
@lib/screens/help_screen.dart
@lib/screens/categories_menu_screen.dart
@lib/screens/category_01.dart
@lib/screens/category_02.dart
@lib/screens/category_03.dart
@lib/screens/chat_page.dart
@lib/screens/login_home_screen.dart
@lib/screens/user_profile_screen.dart
@lib/screens/settings_screen.dart
@lib/screens/background_wrapper.dart
@lib/services/claude_service.dart
@lib/styles/text_field_styles.dart
@lib/styles/text_styles.dart
@lib/widgets/app_background.dart
@lib/widgets/background_wrapper.dart
@lib/widgets/custom_app_bar_with_user.dart
@lib/widgets/base_screen.dart
@lib/widgets/custom_app_bar.dart
@lib/styles/button_styles.dart
@lib/widgets/custom_button.dart
@lib/widgets/custom_text_field.dart
@lib/widgets/screen_wrapper.dart
@lib/widgets/user_icon_button.dart
@test/widget_test.dart

@app_config.dart
@app_theme.dart
@firebase_options.dart
@theme_provider.dart
@help_screen.dart
@categories_menu_screen.dart
@category_01.dart
@category_02.dart
@category_03.dart
@chat_page.dart
@login_home_screen.dart
@user_profile_screen.dart
@settings_screen.dart
@background_wrapper.dart
@claude_service.dart
@text_field_styles.dart
@text_styles.dart
@app_background.dart
@background_wrapper.dart
@custom_app_bar_with_user.dart
@base_screen.dart
@custom_app_bar.dart
@button_styles.dart
@custom_button.dart
@custom_text_field.dart
@screen_wrapper.dart
@user_icon_button.dart
@widget_test.dart

[HotScreen App]
|
+-- [main.dart]
    |
    +-- [LoginScreen] (login_home_screen.dart)
        |
        +-- [CategoriesMenu] (categories_menu_screen.dart)
        |   |
        |   +-- [Category01] (category_01.dart)
        |   +-- [Category02] (category_02.dart)
        |   +-- [Category03] (category_03.dart)
        |
        +-- [ChatPage] (chat_page.dart)
        |   |
        |   +-- [ClaudeService] (claude_service.dart)
        |
        +-- [UserProfileScreen] (user_profile_screen.dart)  // Actualizado
        |
        +-- [SettingsScreen] (settings_screen.dart)
        |   |
        |   +-- [ThemeProvider] (theme_provider.dart)
        |
        +-- [HelpScreen] (help_screen.dart)

[Widgets Compartidos]
|
+-- [AppBackground] (app_background.dart)
+-- [BackgroundWrapper] (background_wrapper.dart)
+-- [BaseScreen] (base_screen.dart)
+-- [CustomAppBar] (custom_app_bar.dart)
+-- [CustomButton] (custom_button.dart)
+-- [CustomTextField] (custom_text_field.dart)
+-- [ScreenWrapper] (screen_wrapper.dart)
+-- [UserIconButton] (user_icon_button.dart)

[Configuración]
|
+-- [AppConfig] (app_config.dart)
+-- [AppTheme] (app_theme.dart)
+-- [FirebaseOptions] (firebase_options.dart)

### Estandarización de Botones

Hemos implementado una clase `CustomButton` para estandarizar los botones en toda la aplicación. Los botones siguen una lógica de clasificación nemotécnica para tamaños, alineándose con los estilos de texto definidos en `text_styles.dart`.

#### Uso de `CustomButton`



#### Tipos y Tamaños Disponibles

- **Tipos:**
  - `ButtonType.primary`
  - `ButtonType.secondary`

- **Tamaños:**
  - `ButtonSize.gigagiant`
  - `ButtonSize.tooBig`
  - `ButtonSize.big`
  - `ButtonSize.medium`
  - `ButtonSize.small`
  - `ButtonSize.micro`
  - `ButtonSize.nano`

### Beneficios

- **Consistencia Visual:** Todos los botones mantienen un diseño uniforme.
- **Reusabilidad:** Facilita la reutilización de componentes sin redundancia.
- **Mantenibilidad:** Centraliza los estilos y facilita futuras modificaciones.