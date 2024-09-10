import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/background_wrapper.dart';

class ChatPage extends StatelessWidget {
  final String title;

  const ChatPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        backgroundColor: Colors.transparent,
        body: const Center(
          child: Text('Contenido de la página de chat'),
        ),
      ),
    );
  }
}