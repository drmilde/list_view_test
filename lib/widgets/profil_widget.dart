import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_test/controller/product_controller.dart';
import 'package:list_view_test/widgets/avatar_widget.dart';

import 'header_widget.dart';

class ProfilWidget extends StatefulWidget {
  const ProfilWidget({Key? key}) : super(key: key);

  @override
  State<ProfilWidget> createState() => _ProfilWidgetState();
}

class _ProfilWidgetState extends State<ProfilWidget> {
  ProductController productController = Get.find();
  List<String> avatars = [
    "assets/avatars/avatar-01.png",
    "assets/avatars/avatar-02.png",
    "assets/avatars/avatar-03.png",
    "assets/avatars/avatar-04.png",
    "assets/avatars/avatar-05.png",
    "assets/avatars/avatar-06.png",
    "assets/avatars/avatar-07.png",
    "assets/avatars/avatar-08.png",
    "assets/avatars/avatar-09.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: "Profil",
          bgindex: 2,
          colorindex: 3,
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height:300,
                  decoration: BoxDecoration(
                    gradient: productController.config.value.gradients[3],
                  ),
                  child: _makeColumn(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _makeColumn() {
    return Column(
            children: [
              Container(
                width: double.infinity,
              ),
              Container(
                width: 300,
                height: 300,
                child: GridView.count(crossAxisCount: 3, children: [
                  AvatarWidget(index: 0),
                  AvatarWidget(index: 1),
                  AvatarWidget(index: 2),
                  AvatarWidget(index: 3),
                  AvatarWidget(index: 4),
                  AvatarWidget(index: 5),
                  AvatarWidget(index: 6),
                  AvatarWidget(index: 7),
                  AvatarWidget(index: 8),
                ]),
              ),
            ],
          );
  }
}
