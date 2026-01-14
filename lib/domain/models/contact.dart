import 'dart:convert';

class Contact {
  final String name;
  final String photoUrl;
  final bool status;

  Contact({required this.name, required this.photoUrl, required this.status});

  factory Contact.fromRawJson(String str) => Contact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    name: json["name"],
    photoUrl: json["photoUrl"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photoUrl": photoUrl,
    "status": status,
  };
}
