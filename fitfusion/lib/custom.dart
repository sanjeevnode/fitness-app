import 'package:fitfusion/constant.dart';
import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String text;
  final IconData icon;
  const Field({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: fieldColors, // Set the background color
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
      child: TextField(
        cursorColor: textColors3,
        style: const TextStyle(color: textColors3),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Set the border radius
            borderSide: BorderSide.none, // Remove the default border
          ),
          prefixIcon: Icon(icon, color: textColors3), // Add a user icon
          hintText: text, // Add a hint
          hintStyle: const TextStyle(color: textColors3),
        ),
      ),
    );
  }
}
