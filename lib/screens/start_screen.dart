import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  List<String> filmtitel = [
    "Wednesday",
    "French Dispatch",
    "Inception",
    "Full Metal Jacket",
    "Rambo",
    "Love actually",
    "Hui Buh",
    "Die Mumie",
    "Disney: eine Weihnachtsgeschichte",
    "Paddington",
    "Heat",
    "Bodyguard",
    "Indiana Jones",
  ];

  StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text("Meine Filmtitel",
                style: TextStyle(
                  fontSize: 24,
                )),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: filmtitel.length,
                    itemBuilder: (context, index) {
                      return _buildCard(index);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Hintergrund
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(69, 185, 129, 129),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 150,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 130,
              height: 150,
              child: Image.network(
                  "https://img.freepik.com/vektoren-kostenlos/eine-tasse-popcorn-grafik-illustration_53876-8059.jpg"),
            ),
          ),
          // Text
          Container(
            height: 140,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                this.filmtitel[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
