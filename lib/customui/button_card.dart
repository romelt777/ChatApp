import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final String name;
  final IconData icon;
  const ButtonCard({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Color(0xFF25D366),
          child: Icon(icon, size: 26, color: Colors.white),
        ),
        title: Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
