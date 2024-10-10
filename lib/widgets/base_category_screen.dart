import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'custom_button.dart';

class BaseCategoryScreen extends StatefulWidget {
  final String title;
  final String searchHint;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Widget content;

  const BaseCategoryScreen({
    super.key,
    required this.title,
    required this.searchHint,
    required this.buttonText,
    required this.onButtonPressed,
    required this.content,
  });

  @override
  State<BaseCategoryScreen> createState() => _BaseCategoryScreenState();
}

class _BaseCategoryScreenState extends State<BaseCategoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: _searchController,
              hintText: widget.searchHint,
              icon: Icons.search,
            ),
          ),
          Expanded(
            child: widget.content,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: widget.buttonText,
              onPressed: widget.onButtonPressed,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}