import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  Function(String filter) callback;

  SearchWidget({required this.callback, Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  String filter = "";
  late TextFormField formfield;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return createForm();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      filter = _controller.text;
      setState(() {
        // refresh
      });
      widget.callback(filter);
    });

    formfield = TextFormField(
      controller: _controller,
      //autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(255, 156, 183, 237)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(255, 156, 183, 237)),
        ),
        border: OutlineInputBorder(),
        hintText: 'Artikelsuche',
      ),
    );
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
