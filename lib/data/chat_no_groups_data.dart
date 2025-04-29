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
      name: "Jake",
      icon: "person.svg",
      isGroup: false,
      time: "10:00",
      currentMessage: "Hey, what's up?",
    ),
    ChatModel(
      id: 102,
      name: "Linda",
      icon: "person.svg",
      isGroup: false,
      time: "10:15",
      currentMessage: "Good morning!",
    ),
    ChatModel(
      id: 103,
      name: "Sam",
      icon: "person.svg",
      isGroup: false,
      time: "10:30",
      currentMessage: "Long time no see!",
    ),
    ChatModel(
      id: 104,
      name: "Tina",
      icon: "person.svg",
      isGroup: false,
      time: "10:45",
      currentMessage: "Any plans for the weekend?",
    ),
    ChatModel(
      id: 105,
      name: "Chris",
      icon: "person.svg",
      isGroup: false,
      time: "11:00",
      currentMessage: "Check out this new song!",
    ),
    ChatModel(
      id: 106,
      name: "Olivia",
      icon: "person.svg",
      isGroup: false,
      time: "11:15",
      currentMessage: "Are we still meeting later?",
    ),
    ChatModel(
      id: 107,
      name: "David",
      icon: "person.svg",
      isGroup: false,
      time: "11:30",
      currentMessage: "Let's catch up soon!",
    ),
  ];
}
