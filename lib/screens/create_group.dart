import 'package:chat_app/customui/button_card.dart';
import 'package:chat_app/customui/contact_card.dart';
import 'package:chat_app/data/contact_data.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _SelectContactState();
}

class _SelectContactState extends State<CreateGroup> {
  final data = ContactData();
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Group", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text("Add Partipants", style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26))],
      ),
      //BODY
      body: ListView.builder(
        itemCount: data.contactData.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (data.contactData[index].select == false) {
                setState(() {
                  data.contactData[index].select = true;
                  groups.add(data.contactData[index]);
                });
              } else {
                setState(() {
                  data.contactData[index].select = false;
                  groups.remove(data.contactData[index]);
                });
              }
            },
            child: ContactCard(contact: data.contactData[index]),
          );
        },
      ),
    );
  }
}
