import 'package:bug_hunter_news/components/badge.widget.dart';
import 'package:bug_hunter_news/components/search.wiget.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/model/Category.dart';
import 'package:bug_hunter_news/widgets/sub.title.widget.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        SearchWidget(),
        _CategoryList(),
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                    color: ColorUI.lightGray,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SpaceUI.borderRadiusx30),
                      topRight: Radius.circular(SpaceUI.borderRadiusx30),
                    )),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SpaceUI.x20, vertical: SpaceUI.x20 / 2),
                height: 100,
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: size.width,
                        padding: EdgeInsets.all(5),
                        child: Wrap(
                          runSpacing: 8,
                          spacing: 9,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                      "https://profile-photos.hackerone-user-content.com/variants/000/000/022/5e2b46658c8b86bed62f574d8e1793f353cbbc63_original.png/94b3712d9e5abbd36ce7a482476dd87ba5bbd7e8343379fcbab9f3c0fe8b2bb9"),
                                )
                              ],
                            ),
                            Column(
                              children: [SubTitleWidget(title: "Hackerone")],
                            )
                          ],
                        ),
                      ),
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
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _CategoryList() {
    var currentItem = 0;
    var categories = [Category(text: "Público"), Category(text: "Privado")];

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SpaceUI.x15,
        ),
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              categories[index].selected = index == currentItem;

              return BadgeWidget(categories[index]);
            }),
      ),
    );
  }
}
