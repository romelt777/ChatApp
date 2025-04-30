import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactCard extends StatelessWidget {
  final ChatModel contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset("assets/person.svg", color: Colors.white, height: 30, width: 30),
            ),
            contact.select ?? false
                ? Positioned(
                  bottom: 4,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 11,
                    child: Icon(Icons.check, color: Colors.white, size: 18),
                  ),
                )
                : Container(),
          ],
        ),
      ),
      title: Text(contact.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      subtitle: Text(contact.status ?? "No Status", style: TextStyle(fontSize: 13)),
    );
  }
}
