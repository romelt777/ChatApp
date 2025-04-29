import 'package:flutter/material.dart';

class AttachmentIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const AttachmentIcon({super.key, required this.icon, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(backgroundColor: color, radius: 30, child: Icon(icon, size: 29, color: Colors.white)),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
