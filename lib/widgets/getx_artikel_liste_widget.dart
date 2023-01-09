import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_test/controller/product_controller.dart';
import 'package:list_view_test/widgets/header_widget.dart';
import 'package:list_view_test/widgets/search_widget.dart';

import '../einkaufmodel/model_class.dart';
import 'modal_bottom_widget.dart';

class GetXArtikelListeWidget extends StatefulWidget {
  bool showHeader = true;
  ModalBottomWidget modalBottomWidget = ModalBottomWidget(
    child: Container(child: Text("ArtikelModal")),
  );

  GetXArtikelListeWidget({this.showHeader = true, Key? key}) : super(key: key);

  @override
  State<GetXArtikelListeWidget> createState() => _GetXArtikelListeWidgetState();

  void showModalSheet(BuildContext context) {
    modalBottomWidget.showModelSheet(context);
  }
}

class _GetXArtikelListeWidgetState extends State<GetXArtikelListeWidget> {
  ProductController productController = Get.find();
  String filter = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.sortArtikel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.showHeader
            ? HeaderWidget(
                title: "Artikelliste",
                bgindex: 0,
                colorindex: 2,
              )
            : Container(),
        Container(
          height: 64,
          color: Color.fromARGB(255, 215, 222, 235),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(child: SearchWidget(
              callback: (value) {
                setState(() {
                  this.filter = value.toLowerCase().trim();
                });
              },
            )),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: productController.config.value.gradients[2],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return (filter == "")
        ? ListView.builder(
            itemCount: productController.artikelListe.length,
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  child: _buildArtikelRow(index),
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: productController.artikelListe.length,
            itemBuilder: (context, index) {
              return Container(
                child: checkFilter(index)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 0),
                        child: _buildArtikelRow(index),
                      )
                    : Container(),
              );
            });
  }

  bool checkFilter(int index) {
    return productController.artikelListe[index].search.contains(filter);
  }

  Widget _buildArtikelRow(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          productController.artikelListe[index].toggleEinkaufswagen();
          _addItem(index);
        });
      },
      child: Container(
        color: Colors.transparent,
        //color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productController.artikelListe[index].name,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Checkbox(
                value: productController.artikelListe[index].imEinkaufswagen,
                onChanged: (value) {
                  setState(() {
                    productController.artikelListe[index].toggleEinkaufswagen();
                    _addItem(index);
                    // TODO Logik einfügen
                  });
                })
          ],
        ),
      ),
    );
  }

  void _addItem(int index) {
    Item sItem = productController.artikelListe[index];
    if (sItem.imEinkaufswagen) {
      productController.addEinkauslisteStart(Item(name: sItem.name));
    } else {
      productController.removeItemFromEinkaufsliste(sItem.name);
    }
  }



  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
  }
}
