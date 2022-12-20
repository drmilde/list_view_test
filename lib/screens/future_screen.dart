import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_view_test/model/entry.dart';

class FutureScreen extends StatefulWidget {

  FutureScreen({Key? key}) : super(key: key);

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  List<Entry> liste = [];

  // https://jsonplaceholder.typicode.com/posts
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              _buildButton(),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: liste.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${index}: ${liste[index].body}"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () async {
        // hier holen wir uns die Daten :)
        var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
        var response = await http.get(url);
        if (response.statusCode == 200) {
          print(response.body);

          setState(() {
            liste = entryFromJson(response.body);
          });

        } else {
          print("son mist");
        }
      },
      child: Text("get json"),
    );
  }
}
