import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../einkaufmodel/model_class.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                productController.addToEinkaufsliste(Item(name:"KLASSE"));
              },
              child: Text("add"),
            ),
            Expanded(child: Obx(() => buildListEinkaufslisteView(context))),
          ],
        ),
      ),
    );
  }

  Widget buildListEinkaufslisteView(BuildContext context) {
    return ListView.builder(
      itemCount: productController.einkaufsliste.length,
      itemBuilder: (context, index) {
        return Container(
          child: Text(productController.einkaufsliste[index].name),
        );
      },
    );
  }
}
