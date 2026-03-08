import 'package:flutter/material.dart';

class OtpButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const OtpButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.teal,
          size: 24,
        ),
        SizedBox(width: 25),
        Text(
          text,
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
