import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalBottomWidget extends StatelessWidget {
  Widget child;

  ModalBottomWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /// Modal Sheet

  void showModelSheet(BuildContext context) {
    showMaterialModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 500),
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: _createModalContent(context),
        //child: GetXArtikelListeWidget(),
      ),
    );
  }

  Widget _createModalContent(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
        height: height,
        //child: _modalContent(),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, top: 0, bottom: 8.0),
          child: Column(
            children: [
              _buildHandle(context),
              Expanded(
                //child: GetXArtikelListeWidget(showHeader: false),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
