import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatefulWidget {
  Program program;
  ProgramCard(this.program, {Key? key}) : super(key: key);

  @override
  State<ProgramCard> createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SpaceUI.borderRadiusx30),
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(widget.program.image!))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SpaceUI.borderRadiusx30),
            gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
