class MessageModel {
  String type;
  String message;
  String time;
  String filePath;
  MessageModel(
      {required this.message,
      required this.type,
      required this.time,
      required this.filePath});
}
