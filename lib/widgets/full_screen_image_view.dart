import 'package:flutter/material.dart';

class FullScreenImageView extends StatelessWidget {
  final String imageAsset;

  const FullScreenImageView({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Hero(
          tag: 'profileImage',
          child: Image.asset(
            imageAsset,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}