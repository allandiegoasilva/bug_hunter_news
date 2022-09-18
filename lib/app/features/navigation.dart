
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key, this.title}) : super(key: key);
  
  final String title;

  @override
  State<NavigationPage> createState() => _NavigationPage(); 
}


class _NavigationPage extends State<NavigationPage>{
   
  MotionTabController _tabController;

  @override 
  void initState(){
    super.initState();
    _tabController = MotionTabController(initialIndex: 1); 
  }

  @override
  void dispose(){
    super.dispose(); 
    _tabController.dispose(); 
  }
  
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("TESTE"),
      ),
      body: SafeArea(
        child: Text("Meio"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [

        ],
      ),
    );
  }
}