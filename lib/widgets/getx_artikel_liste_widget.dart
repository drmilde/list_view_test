import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_test/controller/product_controller.dart';
import 'package:list_view_test/widgets/search_widget.dart';

import '../einkaufmodel/model_class.dart';

class GetXArtikelListeWidget extends StatefulWidget {
  const GetXArtikelListeWidget({Key? key}) : super(key: key);

  @override
  State<GetXArtikelListeWidget> createState() => _GetXArtikelListeWidgetState();
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
        Container(
          height: 64,
          color: Color.fromARGB(255, 153, 157, 153),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(child: SearchWidget(
              callback: (value) {
                setState(() {
                  this.filter = value;
                });
              },
            )),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: productController.artikelListe.length,
            itemBuilder: (context, index) {
              return Container(
                child: checkFilter(index)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 2),
                        child: _buildArtikelRow(index),
                      )
                    : Container(),
              );
            },
          ),
        ),
      ],
    );
  }

  bool checkFilter(int index) {
    String name = productController.artikelListe[index].name.toLowerCase();
    return name.contains(filter.toLowerCase());
  }

  Widget _buildArtikelRow(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          productController.artikelListe[index].toggleEinkaufswagen();
          _addItem(index);
        });
      },
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
