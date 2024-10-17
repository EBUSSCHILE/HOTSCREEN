# HotScreen v1.1.9 "Improved validation system and GitHub update process"

HotScreen is an innovative Flutter application developed in Cursor IDE, designed to offer an interactive and customizable user experience for online language learning. This project is a unique development experiment conducted primarily with Artificial Intelligence, where the human architect acts as a guide and supervisor.

## Main Features
- Customizable user interface
- Enhanced component validation system
- Intuitive navigation between screens
- Responsive and adaptable design
- Interactive language learning modules
- Karaoke function
- Whiteboard functionality
- Validations configuration screen
- Automated GitHub update process

## Project Structure

lib/
├── config/
│   └── app_config.dart
├── constants/
│   └── app_constants.dart
├── screens/
│   ├── login_screen.dart
│   ├── categories_menu_screen.dart
│   ├── karaoke_screen.dart
│   ├── help_screen.dart
│   ├── settings_screen.dart
│   ├── validations_screen.dart
│   └── whiteboard_screen.dart
├── services/
│   ├── file_validation_service.dart
│   └── validation_service.dart
├── styles/
│   ├── app_styles.dart
│   ├── custom_app_bar.dart
│   ├── custom_app_bar_with_user.dart
│   └── custom_app_bar_with_user_and_title.dart
├── widgets/
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   ├── user_icon.dart
│   ├── user_icon_button.dart
│   ├── validation_ring.dart
│   └── background_color_selector.dart
├── utils/
│   ├── version_utils.dart
│   └── code_modification_helper.dart
├── index.dart
└── main.dart

## Key Components
- **ValidationService**: Manages component validation.
- **FileValidationService**: Handles file-related validation with improved JSON formatting.
- **ValidationRing**: Widget for visual representation of component validation status.
- **CustomAppBar**: Customized application bar with UserIcon.
- **CustomButton**: Custom button with consistent styles.
- **LoginScreen**: Enhanced login screen with forgot password functionality.
- **CategoriesMenuScreen**: Displays learning categories with dynamic content.
- **BackgroundColorSelector**: New widget for customizing app background color.
- **VersionUtils**: Utility for managing app version information.
- **CodeModificationHelper**: Assists in safe code modifications.

## Recent Updates
- Improved JSON formatting in FileValidationService for better readability.
- Enhanced ValidationRing widget for more intuitive validation status display.
- Updated LoginScreen with new forgot password functionality.
- Added BackgroundColorSelector for app customization.
- Implemented VersionUtils for easier version management.
- Created automated GitHub update process using a batch script.

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

## GitHub Update Process
We've implemented an automated process for updating the GitHub repository:
1. Update the version in the first line of this README file.
2. Run the `update_github.bat` script from the project root.
3. The script will extract the version, commit changes, create a tag, and push to GitHub.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For any inquiries or suggestions, please open an issue in this repository.

Thank you for your interest in HotScreen!

---

Developed with 🧠 by AI and supervised by humans.
