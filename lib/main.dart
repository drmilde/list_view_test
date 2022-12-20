import 'package:flutter/material.dart';
import 'package:list_view_test/screens/chuck_norris_screen.dart';

import 'screens/future_builder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChuckNorrisScreen(),
    );
  }
}


