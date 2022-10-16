import 'package:bug_hunter_news/core/color_ui.dart';
import 'package:bug_hunter_news/app/pages/invites.page.dart';
import 'package:bug_hunter_news/app/pages/programs.page.dart';
import 'package:flutter/material.dart';

import 'package:bug_hunter_news/app/pages/profile.page.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  State<Template> createState() => _Template();
}

class _Template extends State<Template> {
  int _page = 0;
  static const List<Widget> _pages = [
    ProgramsPage(),
    InvitePage(),
    ProfilePage()
  ];

  void changePage(int index) {
    setState(() {
      _page = index;
    });
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _page,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
      ],
      selectedItemColor: ColorUI.primaryColor,
      onTap: changePage,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages.elementAt(_page),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
