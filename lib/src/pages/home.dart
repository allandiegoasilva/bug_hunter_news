
import 'package:bug_hunter_news/src/pages/login.dart';
import 'package:flutter/material.dart';


class BugHunterNews extends StatefulWidget {

  const BugHunterNews({Key? key}) : super(key: key); 

  @override 
  State<BugHunterNews> createState() => BugHunterNewsState(); 
}

class BugHunterNewsState extends State<BugHunterNews> {

  Widget build(BuildContext context){
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: LoginPage()
    ); 
  }
}