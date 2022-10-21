import 'dart:ui';

import 'package:bug_hunter_news/components/badge.widget.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:bug_hunter_news/widgets/sub.title.widget.dart';
import 'package:bug_hunter_news/widgets/title.widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.program);

  Program program;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget _ScopeList() {
    var currentItem = 0;
    var scopes = ["http://localhost", "http://127.0.0.1"];

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SpaceUI.x15,
        ),
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: scopes.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: SpaceUI.x15),
                padding: EdgeInsets.symmetric(horizontal: SpaceUI.x15),
                child: Text(
                  scopes[index],
                  style: TextStyle(color: Colors.white),
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorUI.primaryColor,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
            )
          ],
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Voltar".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: TextSizeUI.medium,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Center(
                              child: TitleWidget(
                            title: widget.program.name!,
                            color: Colors.white,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                          top: -35,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(360)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Image.network(
                                  widget.program.image!,
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ),
                          )),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 28.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.red,
                                size: 35,
                              ),
                            ),
                          )),
                      Positioned(
                        left: 0,
                        top: 15,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "\$ 100 - 1000",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: SpaceUI.x70,
                            left: SpaceUI.x20,
                            right: SpaceUI.x20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    "Elegible",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              width: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SubTitleWidget(title: "Descrição: "),
                                    Text(
                                        "Lorem ipsum is placeholder text commonly used ")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(
                                  bottom: 15, left: 25, right: 25),
                              decoration: BoxDecoration(
                                color: ColorUI.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        ColorUI.primaryColor.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Realizar Pré Reconhecimento",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: TextSizeUI.medium,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(
                                      Icons.timelapse_outlined,
                                      size: TextSizeUI.title,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      //  _ScopeList()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
