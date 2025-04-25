class ChatModel {
  String name;
  String Icon;
  bool isGroup;
  String time;
  String currentMessage;

  ChatModel(
    {
      required this.name,
      required this.Icon, 
      required this.isGroup, 
      required this.time, 
      required this.currentMessage
    }
  );
}
