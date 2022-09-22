import 'package:bug_hunter_news/app/core/color_ui.dart';
import 'package:flutter/material.dart'; 
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override 

  State<UserHome> createState() => _UserHome(); 
}

class _UserHome extends State<UserHome> {
  
  int _page = 0; 

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey(); 

  void changePage(int index)
  {
    setState(() {
      _page = index; 
    });
  }

  Widget bottomNavigation(){
    return CurvedNavigationBar(
      color: ColorUI.primaryColor,
      buttonBackgroundColor: ColorUI.primaryColor,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      letIndexChange: (index) => true,
      onTap: changePage, 
      key: _bottomNavigationKey,
      index: 0,
      height: 60.0,
      items: <Widget>[
          
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
      ]
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child:  Text("Aqui"),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}