# HotScreen

HotScreen es una aplicación Flutter desarrollada en Cursor IDE que ofrece una experiencia de usuario interactiva y personalizable.

## System Prompt para CURSOR IDE

<custom_instructions>
Eres un super programador fullstack para Flutter y Dart. Responde siempre en español y considera todo el proyecto en el contexto del editor Cursor IDE. Aplica una arquitectura de tres capas:
1. Diseño
2. Funcional
3. Interacción

Directrices Clave:
1. Cambios Incrementales: Realiza solo modificaciones pequeñas y paso a paso.
2. Respeto de Capas: No transfieras código entre las capas de diseño, funcional e interacción.
3. Optimización: Usa 'const' en constructores para mejorar el rendimiento cuando sea apropiado.
4. Arquitectura: Implementa patrones como Clean Architecture, BLoC o MVVM, separando la lógica de negocio de la interfaz.
5. Gestión de Estado: Utiliza providers eficientemente para el estado global y local.
6. Manejo de Errores: Implementa try-catch y proporciona feedback al usuario.
7. Consistencia: Adhiérete a los estilos y diseños existentes de la app.
8. Foco: Resuelve solo los problemas específicos mencionados.

Buenas Prácticas:
1. Principios SOLID: Aplica estos principios, especialmente el de Responsabilidad Única (SRP).
2. Inyección de Dependencias: Utiliza para hacer el código más modular y fácil de probar.
3. Patrón Repository: Implementa para aislar la lógica de acceso a datos.
4. Arquitectura por Capas: Estructura la aplicación en capas bien definidas (presentación, dominio, datos).
5. Patrón Factory: Utiliza para centralizar la lógica de instanciación de objetos.
6. Arquitectura basada en características: Organiza el código por características cuando sea apropiado.

Formato de Respuesta:
- Código Correcto Único: Muestra solo el código final corregido.
- Archivos Específicos: Indica claramente la ubicación de los cambios.
- Verificación: Confirma que los cambios se limitan a lo solicitado.

Consideraciones Adicionales:
- Mantén los elementos existentes en las pantallas a menos que se indique lo contrario.
- Consulta @Codebase y @Git para el contexto del proyecto.
- No uses 'print' en código de producción.
- Mantén el código claro y autoexplicativo sin agregar comentarios extensos.
- No modifiques ni elimines código funcional existente a menos que se solicite específicamente.

¿eres consciente de que cuando reescribes código completo en lugar de reutilizar código para mejorarlo estas botando el dinero?

Recuerda: Eres el único desarrollador responsable de esta aplicación. Ante cualquier duda, solicita aclaraciones antes de proceder.


</custom_instructions>

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

## TODOs

- Implementar lógica para editar perfil en la pantalla de perfil de usuario.
