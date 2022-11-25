import 'package:bug_hunter_news/components/body.white.area.widget.dart';
import 'package:bug_hunter_news/components/body.widget.dart';
import 'package:bug_hunter_news/components/program.card.widget.dart';
import 'package:bug_hunter_news/components/search.wiget.dart';
import 'package:bug_hunter_news/constants/tools.dart';
import 'package:bug_hunter_news/controllers/program.controller.dart';

import 'package:bug_hunter_news/model/program.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  var automationController = ProgramController();
  List<dynamic> programs = [];

  var _controller = ScrollController();
  ScrollPhysics bounceEffect = ClampingScrollPhysics();

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
    var response = await automationController.automates();
    // print(response);
    setState(() {
      programs = response.toList();
    });
  }

  Widget badge(String item, Color color, {double padding: 6}) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Text(
        "$item",
        style: TextStyle(
          color: color,
          fontFamily: 'roboto',
        ),
      ),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      title: "Programas automatizados",
      body: Column(
        children: [
          // SearchWidget(),
          BodyWhiteAreaWidget(
            body: programs.isEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15),
                    child: Text(
                      "Nenhum programa de bug bounty automatizado.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  )
                : ListView.builder(
                    itemCount: programs.length,
                    itemBuilder: (context, index) {
                      var program = programs[index];

                      return Container(
                        height: 150,
                        margin:
                            EdgeInsets.only(bottom: 55, left: 30, right: 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(4, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.network(program["program_title"]),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Text(
                                        program['domain'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          if (program["nmap"] == 1)
                                            badge('Nmap', Colors.grey),
                                          if (program["dig"] == 1)
                                            badge('Dig', Colors.grey),
                                          if (program["whois"] == 1)
                                            badge('Whois', Colors.grey),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
