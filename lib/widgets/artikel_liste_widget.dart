import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_test/controller/product_controller.dart';

import '../einkaufmodel/model_class.dart';

class SelectableItem implements Comparable<SelectableItem>{
  Item item;
  bool selected = false;

  SelectableItem({required this.item, this.selected = false});

  @override
  int compareTo(SelectableItem other) {
    String n1 = this.item.name;
    String n2 = other.item.name;
    return n1.compareTo(n2);
  }
}

class ArtikelListeWidget extends StatefulWidget {
  const ArtikelListeWidget({Key? key}) : super(key: key);

  @override
  State<ArtikelListeWidget> createState() => _ArtikelListeWidgetState();
}

class _ArtikelListeWidgetState extends State<ArtikelListeWidget> {
  ProductController productController = Get.find();
  Model m = Model();
  List<SelectableItem> liste = [];
  String filter = "";
  final TextEditingController _controller = TextEditingController();
  late TextFormField formfield;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _updateListe();

    _controller.addListener(() {
      filter = _controller.text;
      setState(() {
        // refresh
      });
    });

    formfield = TextFormField(
      controller: _controller,
      //autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 57, 212, 57)), //<-- SEE HERE
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 57, 212, 57)), //<-- SEE HERE
        ),
        border: OutlineInputBorder(),
        hintText: 'Artikelsuche',
      ),
    );
  }

  void _updateListe() {
    liste.clear();
    for (Item item in m.artikel) {
      liste.add(SelectableItem(item: item, selected: item.imEinkaufswagen));
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateListe();
    liste.sort();

    return Column(
      children: [
        Container(
          height: 64,
          color: Color.fromARGB(255, 153, 157, 153),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(child: createForm()),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: liste.length,
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
    String name = liste[index].item.name.toLowerCase();
    return name.contains(filter.toLowerCase());
  }

  Widget _buildArtikelRow(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          liste[index].selected = !liste[index].selected;
          _addItem(index);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            liste[index].item.name,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Checkbox(value: liste[index].selected, onChanged: (value) {
            setState(() {
              liste[index].selected = value!;
              _addItem(index);
            });
          })
        ],
      ),
    );
  }

  void _addItem(int index) {
    SelectableItem sItem = liste[index];
    if (sItem.selected) {
        productController.addEinkausliste(Item(name: sItem.item.name));
    } else {
      productController.removeItemFromEinkaufsliste(sItem.item.name);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  Widget createForm() {
    return Form(
      key: _formKey,
      child: formfield,
    );
  }
}
