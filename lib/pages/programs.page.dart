import 'package:bug_hunter_news/components/body.widget.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({super.key});

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUI.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("Programas"),
      ),
      body: BodyWidget(),
    );
  }
}
