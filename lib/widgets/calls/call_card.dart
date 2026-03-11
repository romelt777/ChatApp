import 'package:flutter/material.dart';

class CallCard extends StatelessWidget {
  final String name;
  final IconData iconData;
  final Color iconColor;
  final String time;

  const CallCard({
    super.key,
    required this.name,
    required this.iconData,
    required this.iconColor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 0.5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 26,
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              time,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          size: 28,
          color: Colors.teal,
        ),
      ),
    );
  }
}
