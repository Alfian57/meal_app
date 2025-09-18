import 'package:flutter/material.dart';

class MealListTrait extends StatelessWidget {
  const MealListTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 2),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
