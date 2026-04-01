class MessageModel {
  String type;
  String message;
  String time;
  String? path;
  String chatId;

  MessageModel({
    required this.type,
    required this.message,
    required this.time,
    this.path,
    required this.chatId,
  });
}
