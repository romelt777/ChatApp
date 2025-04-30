import 'package:flutter/material.dart';

class StatusSelf extends StatelessWidget {
  const StatusSelf({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/status/luigi_phone.jpg"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.greenAccent[700],
              child: Icon(color: Colors.white, size: 20, Icons.add),
            ),
          ),
        ],
      ),
      title: Text("My Status", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      subtitle: Text("Tap to Add Status Update", style: TextStyle(fontSize: 13, color: Colors.grey[900])),
    );
  }
}
