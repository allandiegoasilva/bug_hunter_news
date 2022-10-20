import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  String? text;
  Badge({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${this.text}",
      style:
          TextStyle(fontSize: TextSizeUI.medium, fontWeight: FontWeight.bold),
    );
  }
}
