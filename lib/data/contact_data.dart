import 'package:chat_app/model/chat_model.dart';

class ContactData {
  final List<ChatModel> contactData = [
    ChatModel(
      id: 201,
      name: "Rom",
      status: "A full stack developer",
      icon: "person.svg",
      isGroup: false,
      time: "9:00",
      currentMessage: "Hi World",
    ),
    ChatModel(
      id: 202,
      name: "Ralph",
      status: "Flutter developer",
      icon: "person.svg",
      isGroup: false,
      time: "9:10",
      currentMessage: "Hi Rom",
    ),
    ChatModel(
      id: 203,
      name: "Tham",
      status: "Developer",
      icon: "person.svg",
      isGroup: false,
      time: "9:30",
      currentMessage: "Hi Ralph",
    ),
    ChatModel(
      id: 204,
      name: "Bob",
      status: "App developer",
      icon: "group.svg",
      isGroup: true,
      time: "9:40",
      currentMessage: "Hi Buddy",
    ),
    ChatModel(id: 205, name: "Collins", status: "React developer.."),
    ChatModel(id: 212, name: "Heidi", status: "Work hard, nap hard"),
    ChatModel(id: 214, name: "Judy", status: "Reading the docs again..."),
    ChatModel(id: 215, name: "Mallory", status: "Building something cool"),
    ChatModel(id: 216, name: "Nina", status: "Always learning"),
    ChatModel(id: 217, name: "Oscar", status: "👀"),
    ChatModel(id: 218, name: "Peggy", status: "Making it work"),
  ];
}
