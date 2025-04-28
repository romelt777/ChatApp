import 'package:chat_app/model/chat_model.dart';

class ContactData {
  final List<ChatModel> contactData = [
    ChatModel(
      name: "Rom",
      status: "A full stack developer",
      icon: "person.svg",
      isGroup: false,
      time: "9:00",
      currentMessage: "Hi World",
    ),
    ChatModel(
      name: "Ralph",
      status: "Flutter developer",
      icon: "person.svg",
      isGroup: false,
      time: "9:10",
      currentMessage: "Hi Rom",
    ),
    ChatModel(
      name: "Tham",
      status: "Developer",
      icon: "person.svg",
      isGroup: false,
      time: "9:30",
      currentMessage: "Hi Ralph",
    ),
    ChatModel(
      name: "Bob",
      status: "App developer",
      icon: "group.svg",
      isGroup: true,
      time: "9:40",
      currentMessage: "Hi Buddy",
    ),
  ];
}
