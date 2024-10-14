import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../styles/custom_app_bar.dart';
import '../services/validation_service.dart';

class ValidationsScreen extends StatelessWidget {
  const ValidationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: const CustomAppBar(
        title: 'Validaciones',
        showBackButton: true,
      ),
      body: Stack(
        children: [
          FutureBuilder<List<String>>(
            future: ValidationService.getValidationRoutines(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No hay rutinas de validación disponibles.', style: TextStyle(color: Colors.white)));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final routine = snapshot.data![index];
                    return ListTile(
                      title: Text(
                        routine,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      trailing: ValidationService.buildValidationRing('ValidationsScreen', routine),
                    );
                  },
                );
              }
            },
          ),
          Positioned(
            top: 10,
            right: 10,
            child: ValidationService.buildValidationRing('ValidationsScreen', 'Body'),
          ),
        ],
      ),
    );
  }
}
