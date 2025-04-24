import 'package:chat_app/customui/custom_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomCard(),
          CustomCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, 
        child: Icon(Icons.chat)
      )
    );
  }
}
