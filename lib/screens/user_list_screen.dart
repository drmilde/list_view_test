import 'dart:math';

import 'package:flutter/material.dart';
import 'package:list_view_test/screens/user_entry_detail.dart';
import 'package:list_view_test/services/unigo_api.dart';

import '../model/user_entry.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<UserEntry> entryList = [];

  // https://api.UserList.io/jokes/random
  // https://github.com/drmilde/list_view_test

  @override
  void initState() {
    // TODO: implement initState
    entryList = [];
    super.initState();
  }

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
                    color: Color.fromARGB(255, 128, 128, 128),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/user_list.png"),
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
              Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        bool result = await UniGoAPI.createUser();
                        setState(() {});
                      },
                      child: Text("add"),
                    ),
                    ElevatedButton(
                      onPressed: ()  {
                        setState(() {
                          entryList = [];
                        });
                      },
                      child: Text("reload"),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 128, 128, 128),
                child: SizedBox(
                  height: 16,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<List<UserEntry>> snapshot) {
    Random rand = Random(10000000);
    entryList = snapshot.data!;
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            entryList = [];
          });
        },
        child: ListView.builder(
          itemCount: entryList.length,
          itemBuilder: (context, index) {
            final user = entryList[index];
            return Dismissible(
              key: ValueKey<int>(user.id!),
              background: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                ),
              ),
              onDismissed: (DismissDirection direction) async {
                //if (direction == DismissDirection.startToEnd) {
                try {
                  await UniGoAPI.deleteUserById(user.id!);
                } catch(e) {

                }
                setState(() {
                  entryList.removeAt(index);
                  // aktualisieren
                });
                //}
              },
              child: _buildTile(context, user),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, UserEntry user) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserEntryDetailScreen(id: user.id!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: Color.fromARGB(255, 241, 188, 229),
          title:
              Text("${user.displayName} is ${user.firstName} ${user.lastName}"),
        ),
      ),
    );
  }
}
