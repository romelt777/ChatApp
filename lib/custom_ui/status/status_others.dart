import 'package:flutter/material.dart';

class StatusOthers extends StatelessWidget {
  final String? name;
  final String? time;
  final String? imageName;
  const StatusOthers({super.key, required this.name, required this.time, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(radius: 26, backgroundImage: AssetImage(imageName ?? "")),
      title: Text(name ?? "", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      subtitle: Text("Today at, ${time ?? 'Unknown'}", style: TextStyle(fontSize: 14, color: Colors.grey[900])),
    );
  }
}
