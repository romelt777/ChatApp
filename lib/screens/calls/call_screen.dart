import 'package:chat_app/widgets/calls/call_card.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BODY
      body: ListView(
        children: [
          CallCard(),
          CallCard(),
          CallCard(),
          CallCard(),
        ],
      ),
    );
  }
}
