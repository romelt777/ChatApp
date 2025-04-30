import 'package:chat_app/customui/message_reply.dart';
import 'package:chat_app/customui/message_self.dart';
import 'package:chat_app/data/messages_data.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final ScrollController scrollController;
  const MessageList({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    var data = MessagesData();

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: data.messages.length,
        itemBuilder: (context, index) {
          if (data.messages[index].type == "source") {
            return MessageSelf(message: data.messages[index].message, time: data.messages[index].time);
          } else {
            return MessageReply(message: data.messages[index].message, time: data.messages[index].time);
          }
        },
      ),
    );
  }
}
