import 'package:chat_app/model/chat_model.dart';

//using singleton:
// A singleton is a design pattern that ensures a class has only one instance
//throughout the entire app — and provides a global access point to that instance.

class ChatNoGroupsData {
  static final ChatNoGroupsData _instance = ChatNoGroupsData._internal();

  // Factory constructor always returns the same instance
  factory ChatNoGroupsData() {
    return _instance;
  }

  // Private named constructor
  ChatNoGroupsData._internal();

  final List<ChatModel> chatNoGroups = [
    ChatModel(
      id: 101,
      name: "Rom",
      icon: "person.svg",
      isGroup: false,
      time: "9:00",
      currentMessage: "Hey, what's up?",
    ),
    ChatModel(
      id: 102,
      name: "Ralph",
      icon: "person.svg",
      isGroup: false,
      time: "9:10",
      currentMessage: "Good morning!",
    ),
    ChatModel(
      id: 103,
      name: "Tham",
      icon: "person.svg",
      isGroup: false,
      time: "9:30",
      currentMessage: "Long time no see!",
    ),
    ChatModel(
      id: 104,
      name: "Bob",
      icon: "person.svg",
      isGroup: false,
      time: "9:40",
      currentMessage: "Any plans for the weekend?",
    ),
  ];
}
