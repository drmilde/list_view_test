import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  // Image by <a href="https://www.freepik.com/free-vector/avatars-cartoon-style_766799.htm">Freepik</a>
  // <a href="https://www.freepik.com/free-vector/people-wearing-accesories-avatar-collection_1176016.htm#query=avatar%20set&position=32&from_view=keyword">Image by kubanek</a> on Freepik
  // <a href="https://www.freepik.com/free-vector/miscellaneous-people-avatar-collection_1176018.htm#query=avatar%20set&position=36&from_view=keyword">Image by kubanek</a> on Freepik
  // <a href="https://www.freepik.com/free-vector/hipster-people-avatar-collection_1176017.htm#&position=22&from_view=author">Image by kubanek</a> on Freepik

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

  int index = 0;
  double radius = 100;
  double padding = 8.0;

  AvatarWidget(
      {this.index = 0, this.radius = 100, this.padding = 8.0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: CircleAvatar(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius * 2),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: Image.asset(
            "${avatars[index % avatars.length]}",
            width: radius * 2,
            height: radius * 2,
          ),
        ),
        radius: radius,
        backgroundColor: Color.fromARGB(255, 215, 222, 235),
      ),
    );
  }
}
