import 'package:chat_app/customui/custom_card.dart';
import 'package:chat_app/data/chat_data.dart';
import 'package:chat_app/screens/chats/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final data = ChatData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.chatData.length,
        itemBuilder: (context, index) => CustomCard(chatModel: data.chatData[index]),
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
