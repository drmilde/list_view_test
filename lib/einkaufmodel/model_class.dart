import 'dart:core';

class Kategorie {
  String name = "";
}

class Item implements Comparable<Item> {
  String name = "";
  Kategorie kategorie = Kategorie();
  double preis = 0.0;
  int anzahl = 0;
  bool imEinkaufswagen = false;

  Item({this.name = "", this.imEinkaufswagen = false});

  void toggleEinkaufswagen() {
    this.imEinkaufswagen = !this.imEinkaufswagen;
  }

  @override
  int compareTo(Item other) {
    return this.name.compareTo(other.name);
  }
}

class Einkaufsliste {
  List<Item> artikel = [];

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
