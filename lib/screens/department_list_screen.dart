import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_view_test/model/department_entry.dart';
import 'package:list_view_test/model/user_list.dart';
import 'package:list_view_test/services/unigo_api.dart';

import '../model/user_entry.dart';

class DepartmentListScreen extends StatefulWidget {
  const DepartmentListScreen({Key? key}) : super(key: key);

  @override
  _DepartmentListScreenState createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen> {
  //List<UserEntry> jokes = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn5-ss9.sharpschool.com/UserFiles/Servers/Server_8062/Image/Departments/departments%20wordle1.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              FutureBuilder<List<DepartmentEntry>>(
                future: UniGoAPI.getDepartmentsList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _buildListView(snapshot);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //jokes = [];
                  });
                },
                child: Text("clear"),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<List<DepartmentEntry>> snapshot) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final department = snapshot.data![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("${department.name}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
