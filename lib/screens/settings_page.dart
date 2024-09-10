import 'package:flutter/material.dart';
import '../widgets/background_wrapper.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: const Center(
          child: Text(
            'Settings Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
