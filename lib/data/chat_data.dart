import 'package:chat_app/model/chat_model.dart';

class ChatData {
  final List<ChatModel> chatData = [
    ChatModel(id: 1, name: "Rom", icon: "person.svg", isGroup: false, time: "9:00", currentMessage: "Hi World"),
    ChatModel(id: 2, name: "Ralph", icon: "person.svg", isGroup: false, time: "9:10", currentMessage: "Hi Rom"),
    ChatModel(
      id: 3,
      name: "Rom's Server",
      icon: "group.svg",
      isGroup: true,
      time: "9:20",
      currentMessage: "Hi Everyone",
    ),
    ChatModel(id: 4, name: "Tham", icon: "person.svg", isGroup: false, time: "9:30", currentMessage: "Hi Ralph"),
    ChatModel(id: 5, name: "nscc friends", icon: "group.svg", isGroup: true, time: "9:40", currentMessage: "Hi Buddy"),
  ];
}
