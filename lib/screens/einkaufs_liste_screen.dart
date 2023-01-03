import 'package:flutter/material.dart';
import 'package:list_view_test/widgets/einkaufs_liste_widget.dart';
import 'package:list_view_test/widgets/getx_artikel_liste_widget.dart';
import 'package:list_view_test/widgets/getx_einkaufs_liste_widget.dart';
import 'package:list_view_test/widgets/info_widget.dart';
import 'package:list_view_test/widgets/money_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../widgets/artikel_liste_widget.dart';

class EinkaufsListeScreen extends StatefulWidget {
  const EinkaufsListeScreen({Key? key}) : super(key: key);

  @override
  State<EinkaufsListeScreen> createState() => _EinkaufsListeScreenState();
}

class _EinkaufsListeScreenState extends State<EinkaufsListeScreen> {
  int selected = 0;

  List<Widget> widgets = [
    //EinkaufsListeWidget(),
    GetXEinkaufsListeWidget(),
    GetXArtikelListeWidget(),
    InfoWidget(),
    MoneyWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _createModelSheet(context);
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
              label: "Einkaufsliste",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_outlined),
              label: "Artikel",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Übersicht",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.euro),
              label: "Money",
            ),
          ],
        ),
        body: widgets[selected],
      ),
    );
  }

  void _createModelSheet(BuildContext context) {
    //showCupertinoModalBottomSheet (
    showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 500),
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: _createModalContent(),
        //child: GetXArtikelListeWidget(),
      ),
    );
  }

  Widget _createModalContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 153, 157, 153),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        height: 500,
        //child: _modalContent(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: GetXArtikelListeWidget(),
        ),
      ),
    );
  }

  Widget _modalContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildEntry(),
            _buildEntry(),
            _buildEntry(),
            _buildEntry(),
            _buildEntry(),
            _buildEntry(),
          ],
        ),
      ),
    );
  }

  Widget _buildEntry() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.lime,
        width: double.infinity,
        height: 100,
      ),
    );
  }
}
