import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:flutter/material.dart';

class PriceBadgeWidget extends StatelessWidget {
  PriceBadgeWidget(this.price, {Key? key}) : super(key: key);

  String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SpaceUI.x15, vertical: SpaceUI.borderRadiusx20 / 4),
      decoration: BoxDecoration(
          color: ColorUI.primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
      child: Text(
        price!,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
