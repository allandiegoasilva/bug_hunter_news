import 'package:bug_hunter_news/core/text_size_ui.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String? title;
  TitleWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${this.title}",
      style: TextStyle(fontSize: TextSizeUI.title, fontWeight: FontWeight.bold),
    );
  }
}
