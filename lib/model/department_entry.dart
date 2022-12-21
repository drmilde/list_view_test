// To parse this JSON data, do
//
//     final department = departmentFromJson(jsonString);

import 'dart:convert';

DepartmentEntry departmentFromJson(String str) =>
    DepartmentEntry.fromJson(json.decode(str));

String departmentToJson(DepartmentEntry data) => json.encode(data.toJson());

class DepartmentEntry {
  DepartmentEntry({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory DepartmentEntry.fromJson(Map<String, dynamic> json) =>
      DepartmentEntry(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
