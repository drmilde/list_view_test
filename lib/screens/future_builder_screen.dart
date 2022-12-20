import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/entry.dart';

class FutureBuilderScreen extends StatefulWidget {
  const FutureBuilderScreen({Key? key}) : super(key: key);

  @override
  _FutureBuilderScreenState createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {

  // Load to-do list from the server
  Future<List<Entry>> _loadEntryList() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return (entryFromJson(response.body));
    } else {
      return [];
    }
  }
  // https://api.chucknorris.io/jokes/random
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entry List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<Entry>>(
              future: _loadEntryList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildListView(snapshot);
                  //return _doit();
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<List<Entry>> snapshot) {
    return Expanded(
      child: ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final entry = snapshot.data![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("${index}: ${entry.body}"),
            ),
          );
        },
      ),
    );
  }
}
