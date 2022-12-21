import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_view_test/model/user_list.dart';
import 'package:list_view_test/services/unigo_api.dart';

import '../model/user_entry.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  //List<UserEntry> jokes = [];

  // https://api.UserList.io/jokes/random
  // https://github.com/drmilde/list_view_test

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
                          "https://store-images.s-microsoft.com/image/apps.25871.53baf1fd-a88b-421e-96ea-18e584d3df32.2263e8ca-1f9f-4991-8937-d1c42f79ccc3.2fed0e10-4552-446e-b131-5cabd645b924.png"),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              FutureBuilder<List<UserEntry>>(
                future: UniGoAPI.getUserList(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      bool result = await UniGoAPI.createUser("NEUNEUNEU");
                      setState(() {});
                    },
                    child: Text("add"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        //jokes = [];
                      });
                    },
                    child: Text("clear"),
                  ),
                ],
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

  Widget _buildListView(AsyncSnapshot<List<UserEntry>> snapshot) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final user = snapshot.data![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Color.fromARGB(255, 241, 188, 229),
                title: Text(
                    "${user.displayName} is ${user.firstName} ${user.lastName}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
