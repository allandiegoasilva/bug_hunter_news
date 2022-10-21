import 'package:bug_hunter_news/components/price.badge.widget.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:bug_hunter_news/pages/detail.page.dart';
import 'package:bug_hunter_news/widgets/sub.title.widget.dart';
import 'package:flutter/material.dart';

class ProgramCardWidget extends StatefulWidget {
  ProgramCardWidget(this.program, {Key? key}) : super(key: key);

  Program program;

  @override
  State<ProgramCardWidget> createState() => _ProgramCardWidgetState();
}

class _ProgramCardWidgetState extends State<ProgramCardWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailPage(widget.program!))),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: SpaceUI.x20, vertical: SpaceUI.x20 / 2),
        height: 100,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: size.width,
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            widget.program.image!,
                            errorBuilder: (context, error, stackTrace) =>
                                ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/no-photo.png",
                                width: 100,
                                height: 85,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(9),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubTitleWidget(title: widget.program.name!),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(right: -10, child: PriceBadgeWidget("\$ 100 - 1000")),
              Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
