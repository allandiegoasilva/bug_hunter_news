import 'package:bug_hunter_news/core/color_ui.dart';
import 'package:bug_hunter_news/app/pages/invites.page.dart';
import 'package:bug_hunter_news/app/pages/programs.page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:bug_hunter_news/app/pages/profile.page.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  State<Template> createState() => _Template();
}

class _Template extends State<Template> {
  int _page = 0;
  PageController _pageController = PageController();

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  void changePage(int index) {
    setState(() {
      _page = index;
      _pageController.jumpToPage(index);
    });
  }

  Widget bottomNavigation() {
    return CurvedNavigationBar(
        color: ColorUI.primaryColor,
        buttonBackgroundColor: ColorUI.primaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        letIndexChange: (index) => true,
        onTap: changePage,
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.account_circle_outlined, size: 30, color: Colors.white),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            ProgramsPage(),
            InvitePage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
