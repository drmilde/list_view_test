import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_view_test/controller/product_controller.dart';
import 'package:list_view_test/widgets/header_widget.dart';

import 'getx_artikel_liste_widget.dart';
import 'modal_bottom_widget.dart';

class GetXEinkaufsListeWidget extends StatelessWidget {
  ProductController productController = Get.find();
  ModalBottomWidget modalBottomWidget = ModalBottomWidget(
    child: GetXArtikelListeWidget(showHeader: false),
  );

  GetXEinkaufsListeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        //int changed = productController.changed.value;
        return Column(
          children: [
            //_buildSlate(context),
            Expanded(
              child: Column(
                children: [
                  HeaderWidget(
                    title: "Aktuelle Liste",
                    bgindex: 1,
                    colorindex: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: productController.config.value.gradients[1],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _buildSlate(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*
            Expanded(
              flex: 10,
              child: _buildSlate(context),
            ),
            */
          ],
        );
      },
    );
  }

  Container _buildSlate(BuildContext context) {
    return Container(
      color: productController.config.value.colors[1],
      child: Column(
        children: [
          //_buildHeader(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 105, 112, 105),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: Color.fromARGB(255, 212, 173, 110),
                  width: 16.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //child: Obx(() => _buildListView(context)),
                      child: _buildListView(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: productController.einkaufsliste.length,
      itemBuilder: (context, index) {
        return Container(
          key: Key("$index"),
          child: _buildLine(productController.einkaufsliste[index].name, index),
        );
      },
      buildDefaultDragHandles: true,
      onReorder: (int oldIndex, int newIndex) {
        /*
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final int item = _items.removeAt(oldIndex);
        _items.insert(newIndex, item);

         */
      },
    );
  }

  Widget _buildLine(String text, int index) {
    bool selected = productController.einkaufsliste[index].imEinkaufswagen;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      child: Container(
        child: GestureDetector(
          onTap: () {
            productController.toggleEinkaufsliste(index);
          },
          child: Text(
            text,
            style: GoogleFonts.indieFlower(
              color: selected ? Colors.black : Colors.white,
              fontStyle: selected ? FontStyle.italic : FontStyle.normal,
              decoration:
                  selected ? TextDecoration.lineThrough : TextDecoration.none,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Color.fromARGB(255, 105, 112, 105),
      height: 90,
      child: Center(
        child: Text(
          "Einkaufsliste",
          style: GoogleFonts.indieFlower(
            decoration: TextDecoration.underline,
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void showModalSheet(BuildContext context) {
    modalBottomWidget.showModelSheet(context);
  }
}
