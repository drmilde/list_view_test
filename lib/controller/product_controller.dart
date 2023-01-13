import 'package:get/get.dart';
import 'package:list_view_test/model/inventar.dart';

import '../einkaufmodel/model_class.dart';

class ProductController extends GetxController {
  var config = Config().obs;
  Inventar inventar = Inventar();
  var listen = List<Einkaufsliste>.empty(growable: true).obs;
  var selectedEinkaufsliste = 0.obs;
  var changed = 0.obs;

  // Inventar verwalten

  void sortInventar() {
    inventar.sort();
  }

  // Einkauflisten verwalten

  void addEinkaufsliste(String name) {
    listen.add(
      Einkaufsliste(name: name),
    );
  }

  Einkaufsliste getSelectedEinkaufsliste() {
    return listen[selectedEinkaufsliste.value];
  }

  String getSelectedTitle() {
    return listen[selectedEinkaufsliste.value].name;
  }

  void setSelectedEinkaufsliste(int value) {
    if ((value >= 0) && (value < listen.length)) {
      selectedEinkaufsliste.value = value;
      inventar.transferToInventar(listen[selectedEinkaufsliste.value].artikel);
    }
  }

  void removeEinkaufsliste(String name) {
    if (listen.length > 1) {
      // Wenigstens eine Liste muss übrigbleiben
      for (Einkaufsliste e in listen) {
        if (e.name == name) {
          listen.remove(e);
          return;
        }
      }
    }
  }

  // Selected List
  void toggleEinkaufsliste(int index) {
    getSelectedEinkaufsliste().artikel[index].toggleEinkaufswagen();
    listen.refresh();
  }

  void printEinkaufsliste(int index) {
    print(getSelectedEinkaufsliste().artikel[index].imEinkaufswagen);
  }

  void addToEinkaufsliste(Item item) {
    getSelectedEinkaufsliste().addItem(item);
    listen.refresh();
  }

  void addEinkaufslisteStart(Item item) {
    getSelectedEinkaufsliste().insertItem(0, item);
    _refresh();
  }

  void clearEinkaufsliste() {
    getSelectedEinkaufsliste().artikel.clear();
    _refresh();
  }

  void removeFromEinkaufsliste(int index) {
    getSelectedEinkaufsliste().artikel.removeAt(index);
    _refresh();
  }

  void removeItemFromEinkaufsliste(String name) {
    for (Item item in getSelectedEinkaufsliste().artikel) {
      if (item.name == name) {
        getSelectedEinkaufsliste().artikel.remove(item);
        _refresh();
        return;
      }
    }
  }

  void _refresh() {
    changed++;
    listen.refresh();
  }

  /*
  double get summe =>
      warenkorb.value.fold(0.0, (double? sum, Product p) => sum! + p.price!);
   */

  @override
  void onInit() {
    super.onInit();
    //fetchProducts();
    //fetchProductsFromAssets();

    listen.add(Einkaufsliste(name: "Einkaufsliste"));
    selectedEinkaufsliste.value = 0;
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
