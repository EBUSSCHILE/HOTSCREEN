# HotScreen

HotScreen is a Flutter application developed in Cursor IDE that offers an interactive and customizable user experience for online language learning. This application is a development experiment conducted 100% with Artificial Intelligence, where the human architect acts as a guide and supervisor.

## Current Version
v1.1.5 - "Validator Stabilization"

## Main Features
- Customizable user interface
- Component validation system
- Intuitive navigation between screens
- Responsive and adaptable design
- Interactive language learning
- Karaoke function

## Project Structure

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

## Key Components
- **FileValidationService**: Manages component validation.
- **ValidationWrapper**: Wraps widgets for visual validation.
- **CustomAppBar**: Custom application bar with UserIcon.
- **CustomButton**: Custom button with consistent styles.
- **LoginScreen**: Login screen.
- **CategoriesMenuScreen**: Displays learning categories.
- **HelpScreen**: Provides user help and support.
- **KaraokeScreen**: Interactive Karaoke screen.

## Development and Contribution
This project is an AI experiment, but contributions are welcome. If you wish to contribute:
1. Fork the repository.
2. Create a new branch for your feature.
3. Make your changes and ensure tests pass.
4. Submit a pull request with a detailed description of your changes.

## Installation
1. Make sure you have Flutter installed on your system.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to start the application.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For any inquiries or suggestions, please open an issue in this repository.

Thank you for your interest in HotScreen!

---

Developed with 🧠 by AI and supervised by humans.
