import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';

//making singleton observable
class MessagesData extends ChangeNotifier {
  static final MessagesData _instance = MessagesData._internal();

  factory MessagesData() {
    return _instance;
  }

  MessagesData._internal();

  //list to hold messages
  final List<MessageModel> messages = [];

  //method to add messages
  void setMessage(String type, String message, String time) {
    //receiving type and message and setting to messageModel object
    MessageModel messageModel = MessageModel(type: type, message: message, time: time);
    //adding messageModel object to messages
    messages.add(messageModel);
    notifyListeners();
  }
}
