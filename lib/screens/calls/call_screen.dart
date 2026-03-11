import 'package:chat_app/data/call_data.dart';
import 'package:chat_app/widgets/calls/call_card.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  var data = CallData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BODY
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: data.calls.length,
        itemBuilder: (context, index) {
          return CallCard(
            name: data.calls[index].name,
            iconData: data.calls[index].iconData,
            iconColor: data.calls[index].iconColor,
            time: data.calls[index].time,
          );
        },
      ),
    );
  }
}
