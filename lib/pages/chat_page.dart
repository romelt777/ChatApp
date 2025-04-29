import 'package:chat_app/customui/custom_card.dart';
import 'package:chat_app/data/chat_no_groups_data.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/chats/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final data = ChatNoGroupsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.chatNoGroups.length,
        itemBuilder: (context, index) => CustomCard(chatModel: data.chatNoGroups[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}
