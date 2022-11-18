import 'package:bug_hunter_news/components/badge.widget.dart';
import 'package:bug_hunter_news/components/price.badge.widget.dart';
import 'package:bug_hunter_news/components/program.card.widget.dart';
import 'package:bug_hunter_news/components/search.wiget.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/model/Category.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:bug_hunter_news/widgets/sub.title.widget.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  BodyWidget({this.title, this.body});
  String? title;
  Column? body;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  var _controller = ScrollController();
  ScrollPhysics bounceEffect = ClampingScrollPhysics();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels <= 56)
        setState(() => bounceEffect = ClampingScrollPhysics());
      else
        setState(() => bounceEffect = BouncingScrollPhysics());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUI.primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.title!),
        ),
        body: widget.body);
  }
}
