import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:list_view_test/model/department_entry.dart';
import 'package:list_view_test/model/department_list.dart';
import 'package:list_view_test/model/user_entry.dart';
import 'package:list_view_test/model/user_list.dart';

class UniGoAPI {
  static String host = "10.0.2.2:8000";
  static final queryParameters = {
    'format': 'json',
  };

  static Future<List<UserEntry>> getUserList() async {
    final queryParameters = {
      'format': 'json',
    };
    var url = Uri.http(host, '/users/', queryParameters);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = userListFromJson(response.body).data;
      return (data!);
    } else {
      return [];
    }
  }

  static Future<List<DepartmentEntry>> getDepartmentsList() async {
    final queryParameters = {
      'format': 'json',
    };
    var url = Uri.http(host, '/departments/', queryParameters);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = departmentListFromJson(response.body).data;
      return (data!);
    } else {
      return [];
    }
  }

  static Future<DepartmentEntry> getFirstDepartment() async {
    var url = Uri.http(host, '/departments/', queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = departmentListFromJson(response.body).data;
      if (data!.length > 0) {
        return (data![0]);
      }
    }
    return null!;
  }

  static Future<bool> createUser(String first_name) async {

    int firstDepartmentID = 0;
    DepartmentEntry firstDepartment = await getFirstDepartment();
    if (firstDepartment != null) {
      firstDepartmentID = firstDepartment.id!;
    } else {
      return false;
    }

    var url = Uri.http(host, '/users/');
    UserEntry entry = UserEntry(
      firstName: first_name,
      lastName: "lastName",
      displayName: "displayName",
      age: 42,
      department: 3,
      password: "secret",
      preferences: [1],
      id: firstDepartmentID,
    );

    String json = userEntryToJson(entry);
    print(json);
    http.Response resonse = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (resonse.statusCode == 201) {
      return true;
    }
    return false;
  }
}
