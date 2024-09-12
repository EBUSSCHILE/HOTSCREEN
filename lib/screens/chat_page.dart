import 'package:flutter/material.dart';
import '../widgets/app_background.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Chat'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const Center(
          child: Text('Contenido del chat pendiente', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}