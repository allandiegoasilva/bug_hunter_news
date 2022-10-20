import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/model/Category.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatefulWidget {
  BadgeWidget(this.category, {Key? key}) : super(key: key);
  Category category;

  @override
  State<BadgeWidget> createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: SpaceUI.x15),
      padding: EdgeInsets.symmetric(horizontal: SpaceUI.x15),
      child: Text(
        widget.category.text!,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: widget.category.selected
              ? Colors.white.withOpacity(0.4)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
