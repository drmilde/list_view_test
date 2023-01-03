import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_view_test/einkaufmodel/model_class.dart';

class EinkaufsListeWidget extends StatefulWidget {
  const EinkaufsListeWidget({Key? key}) : super(key: key);

  @override
  State<EinkaufsListeWidget> createState() => _EinkaufsListeWidgetState();
}

class _EinkaufsListeWidgetState extends State<EinkaufsListeWidget> {
  List<Item> liste = [
    Item(name: "Rosenkohl"),
    Item(name: "Kohlrabi"),
    Item(name: "Wirsing"),
    Item(name: "Nudeln"),
    Item(name: "Nutella"),
    Item(name: "Milch"),
    Item(name: "Brot"),
    Item(name: "Toastbrot"),
    Item(name: "Kaugummi, blau"),
    Item(name: "Rosenkohl"),
    Item(name: "Kohlrabi"),
    Item(name: "Wirsing"),
    Item(name: "Nudeln"),
    Item(name: "Nutella"),
    Item(name: "Milch"),
    Item(name: "Brot"),
    Item(name: "Toastbrot"),
    Item(name: "Kaugummi, blau"),
    Item(name: "Rosenkohl"),
    Item(name: "Kohlrabi"),
    Item(name: "Wirsing"),
    Item(name: "Nudeln"),
    Item(name: "Nutella"),
    Item(name: "Milch"),
    Item(name: "Brot"),
    Item(name: "Toastbrot"),
    Item(name: "Kaugummi, blau"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 153, 157, 153),
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
              _buildHeader(),
              Divider(
                height: 5,
                color: Color.fromARGB(255, 57, 212, 57),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    itemCount: liste.length,
                    itemBuilder: (context, index) {
                      return _buildLine(liste[index].name, index);
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Color.fromARGB(255, 105, 112, 105),
      height: 48,
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

  Widget _buildLine(String text, int index) {
    bool selected = liste[index].imEinkaufswagen;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      child: Container(
        child: GestureDetector(
          onTap: () {
            setState(() {
              liste[index].toggleEinkaufswagen();
            });
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
}
