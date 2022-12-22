import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:list_view_test/model/department_entry.dart';
import 'package:list_view_test/model/department_list.dart';
import 'package:list_view_test/model/user_entry.dart';
import 'package:list_view_test/model/user_list.dart';
import 'package:list_view_test/services/uni_go_exceptions.dart';

class UniGoAPI {
  static String host = "10.0.2.2:8000";
  static final queryParameters = {
    'format': 'json',
  };

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
    throw ObjectNotFoundException();
  }

/* User */

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

  static Future<bool> createUser() async {
    int firstDepartmentID = 0;
    try {
      DepartmentEntry firstDepartment = await getFirstDepartment();
      firstDepartmentID = firstDepartment.id!;
    } catch (e) {
      return false;
    }

    var url = Uri.http(host, '/users/');
    UserEntry entry = UserEntry(
      department: firstDepartmentID,
    );

    String json = userEntryToJson(entry);
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

  static Future<UserEntry> getUserById(int id) async {
    final queryParameters = {
      'format': 'json',
    };
    var url = Uri.http(host, '/users/${id}', queryParameters);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var answer = json.decode(response.body);
      var entry = userEntryFromJson(jsonEncode(answer['data']));
      return (entry);
    }
    // sonst ein Fehler
    throw new ObjectNotFoundException();
  }


  static Future<bool> deleteUserById(int id) async {
    final queryParameters = {
      'format': 'json',
    };
    var url = Uri.http(host, '/users/${id}', queryParameters);
    var response = await http.delete(url);

    if (response.statusCode == 204) {
      return (true);
    }
    // sonst ein Fehler
    throw new ObjectNotFoundException();
  }

}
