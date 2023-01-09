import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_test/controller/product_controller.dart';
import 'package:list_view_test/widgets/getx_artikel_liste_widget.dart';
import 'package:list_view_test/widgets/getx_einkaufs_liste_widget.dart';
import 'package:list_view_test/widgets/meine_listen_widget.dart';
import 'package:list_view_test/widgets/profil_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EinkaufsListeScreen extends StatefulWidget {
  const EinkaufsListeScreen({Key? key}) : super(key: key);

  @override
  State<EinkaufsListeScreen> createState() => _EinkaufsListeScreenState();
}

class _EinkaufsListeScreenState extends State<EinkaufsListeScreen> {
  ProductController productController = Get.put(ProductController());

  int selected = 0;

  GetXEinkaufsListeWidget einkaufsListeWidget = GetXEinkaufsListeWidget();
  GetXArtikelListeWidget getXArtikelListeWidget = GetXArtikelListeWidget();
  MeineListenWidget meineListenWidget = MeineListenWidget();
  ProfilWidget profilWidget = ProfilWidget();

  List<Widget> widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widgets = [
      //EinkaufsListeWidget(),
      einkaufsListeWidget,
      getXArtikelListeWidget,
      meineListenWidget,
      profilWidget,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            switch (selected) {
              case 0: // Aktuelle Einkaufsliste
                einkaufsListeWidget.showModalSheet(context);
                break;
              case 1: // Artikelliste
                getXArtikelListeWidget.showModalSheet(context);
                break;
              case 2: // Meine Listen
                productController.addEinkaufsliste("Weitere");
                break;
              case 3: // Profil
                break;
            }
          },
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 153, 157, 153),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (selected) {
            setState(() {
              this.selected = selected;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 153, 157, 153),
          currentIndex: selected,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: "Zettel",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_outlined),
              label: "Artikel",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Meine Listen",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Einstellungen",
            ),
          ],
        ),
        body: widgets[selected],
      ),
    );
  }
}
