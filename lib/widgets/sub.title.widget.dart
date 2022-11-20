import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  String? title;
  Color? color;
  SubTitleWidget({this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${this.title}",
      style: TextStyle(
        fontSize: TextSizeUI.medium,
        fontWeight: FontWeight.bold,
        color: this.color,
      ),
    );
  }
}
