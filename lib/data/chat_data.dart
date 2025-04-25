import 'package:chat_app/model/chat_model.dart';

class ChatData {
  final List<ChatModel> chatData = [
    ChatModel(name: "Rom", Icon: "person.svg", isGroup: false, time: "9:00", currentMessage: "Hi World"),
    ChatModel(name: "Ralph", Icon: "person.svg", isGroup: false, time: "9:10", currentMessage: "Hi Rom"),
    ChatModel(name: "Rom's Server", Icon: "group.svg", isGroup: true, time: "9:20", currentMessage: "Hi Everyone"),
    ChatModel(name: "Tham", Icon: "person.svg", isGroup: false, time: "9:30", currentMessage: "Hi Ralph"),
    ChatModel(name: "nscc friends", Icon: "group.svg", isGroup: true, time: "9:40", currentMessage: "Hi Buddy"),

  ];
}
