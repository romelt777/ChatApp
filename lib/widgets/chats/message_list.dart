import 'package:chat_app/customui/message_reply.dart';
import 'package:chat_app/customui/message_self.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: ListView(
        shrinkWrap: true,
        children: [
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
          MessageSelf(),
          MessageReply(),
        ],
      ),
    );
  }
}
