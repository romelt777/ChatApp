class ChatModel {
  int id;
  String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool? select = false;

  ChatModel({
    required this.id,
    required this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select,
  });
}
