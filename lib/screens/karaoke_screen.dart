import 'package:flutter/material.dart';
import '../styles/custom_app_bar.dart';
import '../constants/app_constants.dart';

class KaraokeScreen extends StatelessWidget {
  const KaraokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: CustomAppBar(
        title: 'Karaoke',
        showBackButton: true,
      ),
      body: Center(
        child: Text(
          'Pantalla de Karaoke',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}