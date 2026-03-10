import 'package:chat_app/screens/cameras/camera_screen.dart';
import 'package:chat_app/widgets/chats/attachment_icon.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttachmentBottomSheet extends StatelessWidget {
  final ImagePicker picker;
  final XFile? file;
  final VoidCallback pickImage;

  AttachmentBottomSheet({super.key, required this.picker, this.file, required this.pickImage});

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
                children: [
                  AttachmentIcon(
                    icon: Icons.insert_drive_file,
                    color: Colors.indigo,
                    label: "Document",
                  ),
                  SizedBox(width: 40),
                  AttachmentIcon(
                    icon: Icons.camera_alt,
                    color: Colors.pink,
                    label: "Camera",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => CameraScreen()),
                      );
                    },
                  ),
                  SizedBox(width: 40),
                  AttachmentIcon(
                    icon: Icons.insert_photo,
                    color: Colors.purple,
                    label: "Gallery",
                    onTap: pickImage,
                  ),
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
