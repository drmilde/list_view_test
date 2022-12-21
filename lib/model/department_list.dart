// To parse this JSON data, do
//
//     final departmentList = departmentListFromJson(jsonString);

import 'dart:convert';

import 'package:list_view_test/model/department_entry.dart';

DepartmentList departmentListFromJson(String str) =>
    DepartmentList.fromJson(json.decode(str));

String departmentListToJson(DepartmentList data) => json.encode(data.toJson());

class DepartmentList {
  DepartmentList({
    this.data,
  });

  List<DepartmentEntry>? data;

  factory DepartmentList.fromJson(Map<String, dynamic> json) => DepartmentList(
        data: List<DepartmentEntry>.from(json["data"].map((x) => DepartmentEntry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

