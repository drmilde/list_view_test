import 'package:get/get.dart';

import '../einkaufmodel/model_class.dart';

class ProductController extends GetxController {
  var artikelListe = List<Item>.empty().obs;
  var einkaufsliste = List<Item>.empty().obs;

  /*
  double get summe =>
      warenkorb.value.fold(0.0, (double? sum, Product p) => sum! + p.price!);
   */

  void toggleEinkaufsliste(int index) {
    einkaufsliste[index].toggleEinkaufswagen();
    einkaufsliste.refresh();
  }

  void printEinkaufsliste(int index) {
    print(einkaufsliste[index].imEinkaufswagen);
  }

  void addEinkausliste(Item item) {
    einkaufsliste.add(item);
  }

  void addEinkauslisteStart(Item item) {
    einkaufsliste.insert(0, item);
  }

  void clearEinkaufsliste() {
    einkaufsliste.clear();
  }

  void removeFromEinkaufsliste(int index) {
    einkaufsliste.removeAt(index);
  }

  void removeItemFromEinkaufsliste(String name) {
    for (Item item in einkaufsliste) {
      if (item.name == name) {
        einkaufsliste.remove(item);
        return;
      }
    }
  }

  void sortArtikel() {
    artikelListe.sort();
  }

  @override
  void onInit() {
    super.onInit();
    //fetchProducts();
    //fetchProductsFromAssets();

    einkaufsliste.value = [];
    artikelListe.value = [
      Item(name: "Mehl", imEinkaufswagen: false),
      Item(name: "Eier", imEinkaufswagen: false),
      Item(name: "Milch", imEinkaufswagen: false),
      Item(name: "Brot", imEinkaufswagen: false),
      Item(name: "Toastbrot, weiß", imEinkaufswagen: false),
      Item(name: "Passierte Tomaten", imEinkaufswagen: false),
      Item(name: "Gouda, am Stück", imEinkaufswagen: false),
      Item(name: "Bierschinken", imEinkaufswagen: false),
      Item(name: "Kochschinken", imEinkaufswagen: false),
      Item(name: "Aufbackbrötchen", imEinkaufswagen: false),
      Item(name: "Rama", imEinkaufswagen: false),
      Item(name: "Butter", imEinkaufswagen: false),
      Item(name: "Kopfsalat", imEinkaufswagen: false),
      Item(name: "Hackfleisch, halb und halb", imEinkaufswagen: false),
      Item(name: "Hackfleisch, Rind", imEinkaufswagen: false),
      Item(name: "Reibekuchenteig", imEinkaufswagen: false),
      Item(name: "Teewurst", imEinkaufswagen: false),
      Item(name: "Gouda, Scheiben", imEinkaufswagen: false),
      Item(name: "Käseauswahl", imEinkaufswagen: false),
      Item(name: "Michreis, ohne Geschmack", imEinkaufswagen: false),
      Item(name: "Joghurt", imEinkaufswagen: false),
      Item(name: "Pfefferminztee", imEinkaufswagen: false),
      Item(name: "Kaffeepads, koffeinfrei", imEinkaufswagen: false),
      Item(name: "Cola, light", imEinkaufswagen: false),
      Item(name: "Cola, zero", imEinkaufswagen: false),
      Item(name: "Deostick", imEinkaufswagen: false),
      Item(name: "Shampoo", imEinkaufswagen: false),
      Item(name: "Zucker", imEinkaufswagen: false),
      Item(name: "Mettwurst, mit Zwiebeln", imEinkaufswagen: false),
      Item(name: "Salami", imEinkaufswagen: false),
      Item(name: "Camenbert", imEinkaufswagen: false),
      Item(name: "Sprühsahne", imEinkaufswagen: false),
      Item(name: "Schlagsahne", imEinkaufswagen: false),
      Item(name: "Brötchen", imEinkaufswagen: false),
      Item(name: "Rosenkohl", imEinkaufswagen: false),
      Item(name: "Nudeln", imEinkaufswagen: false),
      Item(name: "Wirsing", imEinkaufswagen: false),
      Item(name: "Nutella", imEinkaufswagen: false),
      Item(name: "Kaugummi, blau", imEinkaufswagen: false),
      Item(name: "Kaugummi, rosa", imEinkaufswagen: false),
      Item(name: "Salz", imEinkaufswagen: false),
      Item(name: "Damenbinden", imEinkaufswagen: false),
      Item(name: "Zahnpasta", imEinkaufswagen: false),
    ];
  }

/*
  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    productList.value = products;
  }

  void fetchProductsFromAssets() async {
    var products = await RemoteServices.fetchProductsFromAssets();
    productList.value = products;
  }
   */
}
