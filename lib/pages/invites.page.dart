import 'package:bug_hunter_news/components/body.white.area.widget.dart';
import 'package:bug_hunter_news/components/body.widget.dart';
import 'package:bug_hunter_news/components/program.card.widget.dart';
import 'package:bug_hunter_news/components/search.wiget.dart';
import 'package:bug_hunter_news/data/invites.mock.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:flutter/material.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  var _controller = ScrollController();
  ScrollPhysics bounceEffect = ClampingScrollPhysics();

  List<Program> programs = [
    ...mockInvites(),
    ...mockInvites(),
    ...mockInvites()
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
      title: "Últimos convites",
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
