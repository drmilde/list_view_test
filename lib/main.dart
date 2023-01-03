import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:list_view_test/screens/einkaufs_liste_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Einkaufsliste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EinkaufsListeScreen(),
      //home: HomeScreen(),
    );
  }
}
