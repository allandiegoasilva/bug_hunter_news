import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(SpaceUI.x15),
      padding: EdgeInsets.symmetric(
          horizontal: SpaceUI.x15, vertical: SpaceUI.x20 / 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(SpaceUI.borderRadiusx20)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Pesquisar",
            suffixIcon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
