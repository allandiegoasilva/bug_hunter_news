import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String? title;

  CustomAppBar({this.title});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(color: Colors.black),
        title: Text(
          "${this.title}",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.5);
  }
}
