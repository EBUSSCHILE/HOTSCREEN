// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotscreen/main.dart'; // Asegúrate de que este nombre coincida con tu paquete

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    debugPrint('Iniciando test de la pantalla de login');
    
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    debugPrint('App construida');

    // Verify that the login screen is shown.
    expect(find.text('Login'), findsOneWidget);
    debugPrint('Texto "Login" encontrado');

    expect(find.text('Email'), findsOneWidget);
    debugPrint('Campo de email encontrado');

    expect(find.text('Contraseña'), findsOneWidget);
    debugPrint('Campo de contraseña encontrado');

    expect(find.text('Iniciar Sesión'), findsOneWidget);
    debugPrint('Botón de inicio de sesión encontrado');

    debugPrint('Test completado con éxito');
  });
}