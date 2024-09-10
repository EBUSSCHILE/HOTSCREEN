import 'package:flutter/material.dart';
import '../widgets/background_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: const Center(
          child: Text(
            'Profile Page Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
