import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String username, String password) async {
    // Aquí iría la lógica real de autenticación, por ahora simularemos un login exitoso
    await Future.delayed(const Duration(seconds: 2)); // Simulamos una operación asíncrona
    _isAuthenticated = true;
    notifyListeners();
    return _isAuthenticated;
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
