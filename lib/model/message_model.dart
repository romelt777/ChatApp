class MessageModel {
  String type;
  String message;
  String time;
  String? path;
  MessageModel({required this.type, required this.message, required this.time, this.path});
}
