import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_view_test/controller/product_controller.dart';
import 'package:list_view_test/widgets/header_widget.dart';

class MeineListenWidget extends StatefulWidget {
  const MeineListenWidget({Key? key}) : super(key: key);

  @override
  State<MeineListenWidget> createState() => _MeineListenWidgetState();
}

class _MeineListenWidgetState extends State<MeineListenWidget> {
  ProductController productController = Get.find();
  var colors;
  var backgrounds;

  @override
  void initState() {
    super.initState();
    colors = productController.config.value.colors;
    backgrounds = productController.config.value.backgrounds;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 164, 164, 164),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderWidget(
            title: "Meine Listen",
            bgindex: 3,
            colorindex: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: productController.config.value.gradients[0],
                    ),
                    child: _buildContent(),
                  ),
                ),
              ],
            ),
          ),
          /*
          Expanded(
            child: _buildContent(),
          ),
          */
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Obx(
      () => ListView.builder(
        itemCount: productController.listen.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Center(
                child: _buildListenTile(
                    name: "${productController.listen[index].name}",
                    index: index),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListenTile({String name = "Einkausliste", int index = 0}) {
    double width = MediaQuery.of(context).size.width * 0.9;
    return Stack(
      children: [
        Container(
          width: width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: colors[index % colors.length],
          ),
        ),
        Container(
          width: width,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 5,
                color: Colors.white,
              ),
              image: DecorationImage(
                image: AssetImage("${backgrounds[index % backgrounds.length]}"),
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
                    color: Color.fromARGB(255, 112, 112, 112),
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
