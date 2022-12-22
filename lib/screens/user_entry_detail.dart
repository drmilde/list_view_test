import 'package:flutter/material.dart';
import 'package:list_view_test/services/unigo_api.dart';

import '../model/user_entry.dart';

class UserEntryDetailScreen extends StatefulWidget {
  int id = 0;

  UserEntryDetailScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<UserEntryDetailScreen> createState() => _UserEntryDetailScreenState();
}

class _UserEntryDetailScreenState extends State<UserEntryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<UserEntry>(
          future: UniGoAPI.getUserById(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildView(context, snapshot);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _buildView(BuildContext context, AsyncSnapshot<UserEntry> snapshot) {
    UserEntry entry = snapshot.data!;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 100,
        width: double.infinity,
        color: Color.fromARGB(255, 181, 238, 193),
        child: Center(child: Text("${entry.id}: ${entry.displayName}")),
      ),
    );
  }
}
