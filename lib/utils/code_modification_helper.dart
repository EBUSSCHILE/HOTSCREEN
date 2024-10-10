import '../services/validation_service.dart';

class CodeModificationHelper {
  static Future<bool> canModifyComponent(String componentName) async {
    final config = await ValidationService.readValidationConfig();
    return !(config[componentName] ?? false);
  }
}
