import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/color_model.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorModel>(
      builder: (context, colorModel, _) => ElevatedButton(
        child: const Text('Cambiar color'),
        onPressed: () {
          colorModel.setBackgroundColor(Colors.blue); // Cambia a un color fijo por ahora
        },
      ),
    );
  }
}
