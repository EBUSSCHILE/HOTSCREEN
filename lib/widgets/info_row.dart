import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppConstants.standardTextColor),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: AppConstants.standardTextColor.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: AppConstants.standardTextColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}