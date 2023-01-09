import 'dart:core';

import 'package:flutter/material.dart';

class Config {
  List<String> backgrounds = [
    "assets/backgrounds/background-02.png",
    "assets/backgrounds/background-03.png",
    "assets/backgrounds/background-04.png",
    "assets/backgrounds/background-05.png",
    "assets/backgrounds/background-06.png",
    "assets/backgrounds/background-07.png",
  ];

  List<Color> colors = [
    Color.fromARGB(255, 241, 197, 197),
    Color.fromARGB(255, 211, 228, 211),
    Color.fromARGB(255, 215, 222, 235),
    Color.fromARGB(255, 156, 183, 237),
    Color.fromARGB(255, 226, 159, 159),
  ];

  Color grayDark = Color.fromARGB(255, 128, 128, 129);
  Color grayLight = Color.fromARGB(255, 154, 154, 154);
  Color bottomNavigationBackground = Color.fromARGB(255, 153, 157, 153);

  List<LinearGradient> gradients = [];

  Config() {
    for (var c in colors) {
      gradients.add(_createGradient(start: bottomNavigationBackground, end: c));
    }
  }

  LinearGradient _createGradient({required Color start, required Color end}) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: [0.0, 0.0, 0.0],
      colors: [
        start,
        end,
        end,
      ],
    );
  }
}

class Kategorie {
  String name = "";
}

class Item implements Comparable<Item> {
  String name = "";
  Kategorie kategorie = Kategorie();
  double preis = 0.0;
  int anzahl = 0;
  bool imEinkaufswagen = false;
  String search = "";

  Item({this.name = "", this.imEinkaufswagen = false}) {
    this.search = name.toLowerCase();
  }

  void toggleEinkaufswagen() {
    this.imEinkaufswagen = !this.imEinkaufswagen;
  }

  @override
  int compareTo(Item other) {
    return this.name.compareTo(other.name);
  }
}

class Einkaufsliste {
  String name = "";
  List<Item> artikel = [];

  Einkaufsliste({required this.name});

  void addItem(Item item) {
    artikel.add(item);
  }

  void clear() {
    artikel.clear();
  }
}

class Einheit {
  String name = "";
}

class Zutat {
  String name = "";
  Einheit einheit = Einheit();
  double anzahl = 0;
}

class Rezept {
  String name = "";
  List<Zutat> zutaten = [];
  List<String> beschreibung = [];
}

class Model {
  List<Item> artikel = [];
  List<Einkaufsliste> listen = [];
  List<Rezept> rezepte = [];
}
