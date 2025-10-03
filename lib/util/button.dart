import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final dynamic text;
  final dynamic icon;
  final dynamic color;
  final dynamic backgroundColor;
  final dynamic side;
  final dynamic onPressed;

  const Button({super.key, required this.text, required this.icon, required this.color, required this.backgroundColor, required this.side, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: Text(
        // "Edit Profile",
        text,
        style: TextStyle(fontSize: 16, color: color),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: side,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
      ),
    );
  }
}
