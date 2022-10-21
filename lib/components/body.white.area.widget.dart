import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:flutter/material.dart';

class BodyWhiteAreaWidget extends StatefulWidget {
  BodyWhiteAreaWidget({this.body, this.marginTop = 70});
  Widget? body;
  double marginTop;
  @override
  State<BodyWhiteAreaWidget> createState() => _BodyWhiteAreaWidgetState();
}

class _BodyWhiteAreaWidgetState extends State<BodyWhiteAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: widget.marginTop),
            decoration: BoxDecoration(
                color: ColorUI.lightGray,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SpaceUI.borderRadiusx20),
                  topRight: Radius.circular(SpaceUI.borderRadiusx20),
                )),
          ),
          widget.body!
        ],
      ),
    );
  }
}
