// To parse this JSON data, do
//
//     final userEntry = userEntryFromJson(jsonString);

import 'dart:convert';

UserEntry userEntryFromJson(String str) => UserEntry.fromJson(json.decode(str));

String userEntryToJson(UserEntry data) => json.encode(data.toJson());

class UserEntry {
  UserEntry({
    this.id = 0,
    this.firstName = "firstName",
    this.lastName = "lastName",
    this.displayName = "displayName",
    this.password = "password",
    this.age = 42,
    this.department = 0,
    this.preferences = const [],
  });

  int? id;
  String? firstName;
  String? lastName;
  String? displayName;
  String? password;
  int? age;
  int? department;
  List<int>? preferences;

  factory UserEntry.fromJson(Map<String, dynamic> json) => UserEntry(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    displayName: json["display_name"],
    password: json["password"],
    age: json["age"],
    department: json["department"],
    preferences: List<int>.from(json["preferences"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "display_name": displayName,
    "password": password,
    "age": age,
    "department": department,
    "preferences": List<dynamic>.from(preferences!.map((x) => x)),
  };
}
