import 'package:bug_hunter_news/components/badge.widget.dart';
import 'package:bug_hunter_news/components/body.white.area.widget.dart';
import 'package:bug_hunter_news/components/body.widget.dart';
import 'package:bug_hunter_news/components/program.card.widget.dart';
import 'package:bug_hunter_news/components/search.wiget.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/program.type.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/controllers/program.controller.dart';
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
  var programController = ProgramController();

  ScrollPhysics bounceEffect = ClampingScrollPhysics();

  List<Program> programs = [];

  @override
  void initState() {
    fetchPrograms();
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels <= 56)
        setState(() => bounceEffect = ClampingScrollPhysics());
      else
        setState(() => bounceEffect = BouncingScrollPhysics());
    });
  }

  void fetchPrograms() async {
    var response = await programController.read();

    setState(() => programs = response.toList());
  }

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      title: "Programas",
      body: Column(
        children: [
          SearchWidget(),
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
}
