import 'package:chat_app/model/call_model.dart';
import 'package:flutter/material.dart';

class CallData {
  final List<CallModel> calls = [
    CallModel(
      name: 'Rom',
      iconData: Icons.call_received,
      iconColor: Color(0xFF4CAF50),
      time: 'Today, 9:00 AM',
    ),
    CallModel(
      name: 'Ralph',
      iconData: Icons.call_made,
      iconColor: Color(0xFF2196F3),
      time: 'March 14, 15:07',
    ),
    CallModel(
      name: 'Tham',
      iconData: Icons.call_missed,
      iconColor: Color(0xFFF44336),
      time: 'March 11, 16:35',
    ),
    CallModel(
      name: 'Bob',
      iconData: Icons.call_received,
      iconColor: Color(0xFF4CAF50),
      time: 'January, 01:40 ',
    ),
  ];
}
