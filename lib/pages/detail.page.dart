import 'dart:ui';

import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:bug_hunter_news/widgets/title.widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.program);

  Program program;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                          ))
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
