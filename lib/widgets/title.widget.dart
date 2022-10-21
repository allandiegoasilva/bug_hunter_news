import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String? title;
  Color color;
  TitleWidget({this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${this.title}",
      style: TextStyle(
          fontSize: TextSizeUI.title,
          fontWeight: FontWeight.bold,
          color: color),
    );
  }
}
