import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_view_test/controller/product_controller.dart';

class HeaderWidget extends StatefulWidget {
  String title;
  String subtitle;
  int bgindex;
  int colorindex;

  HeaderWidget(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.bgindex = 0,
      this.colorindex = 0,
      Key? key})
      : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  ProductController productController = Get.find();

  List<String> backgrounds = [
    "assets/backgrounds/headers/header-background-blue.png",
    "assets/backgrounds/headers/header-background-green.png",
    "assets/backgrounds/headers/header-background-orange.png",
    "assets/backgrounds/headers/header-background-red.png",
  ];

  var colors;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colors = productController.config.value.colors;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: colors[widget.colorindex % colors.length],
        child: _buildListenTile(
          name: widget.title,
          bgindex: widget.bgindex,
        ));
  }

  Widget _buildListenTile(
      {String name = "Einkaufsliste", int bgindex = 0}) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: width,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          width: width,
          height: 90,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("${backgrounds[bgindex % backgrounds.length]}"),
            fit: BoxFit.cover,
          )),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Text(
                  name,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
