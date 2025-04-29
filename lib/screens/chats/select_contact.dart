import 'package:chat_app/customui/button_card.dart';
import 'package:chat_app/customui/contact_card.dart';
import 'package:chat_app/data/contact_data.dart';
import 'package:chat_app/screens/chats/create_group.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  final data = ContactData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text(
              data.contactData.length != 1
                  ? "${data.contactData.length.toString()}  Contacts"
                  : "${data.contactData.length.toString()}  Contact",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
          PopupMenuButton<String>(
            onSelected: (value) => {print(value)},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "Invite a Friend", child: Text("Invite a Friend")),
                PopupMenuItem(value: "Contacts", child: Text("Contacts")),
                PopupMenuItem(value: "Refresh", child: Text("Refresh")),
                PopupMenuItem(value: "Help", child: Text("Help")),
              ];
            },
          ),
        ],
      ),
      //BODY
      body: ListView.builder(
        itemCount: data.contactData.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => CreateGroup()));
              },
              child: ButtonCard(icon: Icons.group, name: "New Group"),
            );
          } else if (index == 1) {
            return ButtonCard(icon: Icons.person_add, name: "New Contact");
          }
          return InkWell(onTap: () {}, child: ContactCard(contact: data.contactData[index - 2]));
        },
      ),
    );
  }
}
