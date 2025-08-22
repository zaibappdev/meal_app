import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Icon(
          icon,
          size: screenSize.width * 0.05, // responsive icon size
          color: Colors.white,
        ),
        SizedBox(width: screenSize.width * 0.015),
        Text(
          label,
          style: TextStyle(
            fontSize: screenSize.width * 0.04, // responsive text size
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
