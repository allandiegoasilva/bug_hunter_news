import 'package:bug_hunter_news/components/badge.widget.dart';
import 'package:bug_hunter_news/components/body.white.area.widget.dart';
import 'package:bug_hunter_news/components/body.widget.dart';
import 'package:bug_hunter_news/components/program.card.widget.dart';
import 'package:bug_hunter_news/components/search.wiget.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/data/programs.mock.dart';
import 'package:bug_hunter_news/model/Category.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({super.key});

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  var _controller = ScrollController();
  ScrollPhysics bounceEffect = ClampingScrollPhysics();

  List<Program> programs = [
    ...mockPrograms(),
    ...mockPrograms(),
    ...mockPrograms()
  ];

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
    return BodyWidget(
      title: "Programas",
      body: Column(
        children: [
          SearchWidget(),
          _CategoryList(),
          BodyWhiteAreaWidget(
            body: ListView.builder(
              controller: _controller,
              physics: bounceEffect,
              itemCount: programs.length,
              itemBuilder: (context, index) =>
                  ProgramCardWidget(programs[index]),
            ),
          )
        ],
      ),
    );
  }

  Widget _CategoryList() {
    var currentItem = 0;
    var categories = [Category(text: "Público"), Category(text: "Privado")];

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SpaceUI.x15,
        ),
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              categories[index].selected = index == currentItem;

              return BadgeWidget(categories[index]);
            }),
      ),
    );
  }
}
