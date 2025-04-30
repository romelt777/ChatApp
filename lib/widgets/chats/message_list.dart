import 'package:chat_app/customui/message_reply.dart';
import 'package:chat_app/customui/message_self.dart';
import 'package:chat_app/data/messages_data.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    var data = MessagesData();

    return SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.messages.length,
        itemBuilder: (context, index) {
          if (data.messages[index].type == "source") {
            return MessageSelf(message: data.messages[index].message);
          } else {
            return MessageReply(message: data.messages[index].message);
          }
        },
      ),
    );
  }
}
