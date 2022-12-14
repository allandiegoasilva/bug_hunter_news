import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/pages/login.page.dart';
import 'package:bug_hunter_news/pages/register.page.dart';
import 'package:bug_hunter_news/pages/template.page.dart';
import 'package:flutter/material.dart';

class BugHunterNews extends StatefulWidget {
  const BugHunterNews({Key? key}) : super(key: key);

  @override
  State<BugHunterNews> createState() => BugHunterNewsState();
}

class BugHunterNewsState extends State<BugHunterNews> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: ColorUI.primaryColor,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: ColorUI.primaryColor,
                secondary: ColorUI.primaryColor,
              ),
          inputDecorationTheme: InputDecorationTheme(
              focusColor: ColorUI.primaryColor,
              fillColor: ColorUI.primaryColor,
              floatingLabelStyle: TextStyle(color: ColorUI.primaryColor),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid, color: ColorUI.primaryColor))),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: ColorUI.primaryColor,
              selectionColor: ColorUI.primaryColor,
              selectionHandleColor: ColorUI.primaryColor)),
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/home_user": (context) => Template(),
      },
      initialRoute: "/login",
    );
  }
}
