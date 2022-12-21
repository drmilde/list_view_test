// To parse this JSON data, do
//
//     final userList = userListFromJson(jsonString);

import 'dart:convert';

import 'package:list_view_test/model/user_entry.dart';

UserList userListFromJson(String str) => UserList.fromJson(json.decode(str));

String userListToJson(UserList data) => json.encode(data.toJson());

class UserList {
  UserList({
    this.data,
  });

  List<UserEntry>? data;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    data: List<UserEntry>.from(json["data"].map((x) => UserEntry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

