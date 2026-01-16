import 'dart:convert';

class Message {
  final String message;
  final String date;
  final String chatId;
  final String sentBy;

  Message({
    required this.message,
    required this.date,
    required this.chatId,
    required this.sentBy,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json["message"],
    date: json["date"],
    chatId: json["chatId"],
    sentBy: json["sentBy"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "date": date,
    "chatId": chatId,
    "sentBy": sentBy,
  };
}
