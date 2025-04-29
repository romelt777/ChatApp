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
    ChatModel(name: "Collins", status: "Raect developer.."),
    ChatModel(name: "Kishor", status: "Full Stack Web"),
    ChatModel(name: "Testing1", status: "Example work"),
    ChatModel(name: "Testing2", status: "Sharing is caring"),
    ChatModel(name: "Divyanshu", status: "....."),
    ChatModel(name: "Helper", status: "Love you Mom Dad"),
    ChatModel(name: "Tester", status: "I find the bugs"),
    ChatModel(name: "Heidi", status: "Work hard, nap hard"),
    ChatModel(name: "Ivan", status: "Just chilling 😎"),
    ChatModel(name: "Judy", status: "Reading the docs again..."),
    ChatModel(name: "Mallory", status: "Building something cool"),
    ChatModel(name: "Nina", status: "Always learning"),
    ChatModel(name: "Oscar", status: "👀"),
    ChatModel(name: "Peggy", status: "Making it work"),
    ChatModel(name: "Sybil", status: "Stay curious"),
  ];
}
