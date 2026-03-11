import 'package:chat_app/data/call_data.dart';
import 'package:chat_app/widgets/calls/call_card.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
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
