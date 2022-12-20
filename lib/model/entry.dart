// To parse this JSON data, do
//
//     final entry = entryFromJson(jsonString);

import 'dart:convert';

List<Entry> entryFromJson(String str) =>
    List<Entry>.from(json.decode(str).map((x) => Entry.fromJson(x)));

String entryToJson(List<Entry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Entry {
  Entry({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
