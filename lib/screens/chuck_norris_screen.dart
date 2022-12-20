import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_view_test/model/chuck_norris_joke.dart';

class ChuckNorrisScreen extends StatefulWidget {
  const ChuckNorrisScreen({Key? key}) : super(key: key);

  @override
  _ChuckNorrisScreenState createState() => _ChuckNorrisScreenState();
}

class _ChuckNorrisScreenState extends State<ChuckNorrisScreen> {
  // Load to-do list from the server
  Future<CnJoke> _loadJoke() async {
    var url = Uri.https('api.chucknorris.io', '/jokes/random');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return (cnJokeFromJson(response.body));
    } else {
      return CnJoke();
    }
  }

  // https://api.chucknorris.io/jokes/random
  // https://github.com/drmilde/list_view_test

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Joke'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<CnJoke>(
              future: _loadJoke(),
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

  Widget _buildListView(AsyncSnapshot<CnJoke> snapshot) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            final joke = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("${index}: ${joke.value}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
