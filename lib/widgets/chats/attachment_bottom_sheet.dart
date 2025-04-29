import 'package:chat_app/widgets/chats/attachment_icon.dart';
import 'package:flutter/material.dart';

class AttachmentBottomSheet extends StatelessWidget {
  const AttachmentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AttachmentIcon(icon: Icons.insert_drive_file, color: Colors.indigo, label: "Document"),
                  SizedBox(width: 40),
                  AttachmentIcon(icon: Icons.camera_alt, color: Colors.pink, label: "Camera"),
                  SizedBox(width: 40),
                  AttachmentIcon(icon: Icons.insert_photo, color: Colors.purple, label: "Gallery"),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AttachmentIcon(icon: Icons.headset, color: Colors.orange, label: "Audio"),
                  SizedBox(width: 40),
                  AttachmentIcon(icon: Icons.location_pin, color: Colors.teal, label: "Location"),
                  SizedBox(width: 40),
                  AttachmentIcon(icon: Icons.person, color: Colors.blue, label: "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
