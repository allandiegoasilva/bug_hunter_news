import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:flutter/material.dart';

class PriceBadgeWidget extends StatelessWidget {
  PriceBadgeWidget(this.price, this.offerBounty, {Key? key}) : super(key: key);

  String price;
  bool offerBounty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, left: 10, top: 10),
      decoration: BoxDecoration(
          color:
              offerBounty ? ColorUI.primaryColor.withOpacity(0.5) : Colors.red,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
      child: Text(
        offerBounty ? price! : "Sem pagto.",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: offerBounty ? Colors.black : Colors.white),
      ),
    );
  }
}
