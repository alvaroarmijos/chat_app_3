import 'dart:convert';

class Message {
  final String message;
  final DateTime date;
  final String sentBy;

  Message({required this.message, required this.date, required this.sentBy});

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json["message"],
    date: json["messageDate"],
    sentBy: json["sentBy"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messageDate": date,
    "sentBy": sentBy,
  };
}
