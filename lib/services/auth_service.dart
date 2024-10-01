import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  // ... otros métodos y propiedades ...

  void logout() {
    // Implementa la lógica de logout aquí
    notifyListeners();
  }
}
