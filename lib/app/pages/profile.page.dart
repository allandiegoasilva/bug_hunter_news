import 'package:bug_hunter_news/app/pages/platform.page.dart';
import 'package:bug_hunter_news/core/color_ui.dart';
import 'package:bug_hunter_news/core/space_ui.dart';
import 'package:bug_hunter_news/core/text_size_ui.dart';
import 'package:flutter/material.dart';
import 'package:bug_hunter_news/app/model/platform.information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Perfil",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.5,
        ),
        body: Column(
          children: [_money(), _keyList()],
        ));
  }

  Widget _money() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(SpaceUI.x0, SpaceUI.x15, SpaceUI.x0, 5),
              child: Text(
                "Saldo disponível",
                style: TextStyle(
                    fontSize: TextSizeUI.normal,
                    color: ColorUI.offuscated,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "R\$ 0,00",
              style: TextStyle(
                  fontSize: TextSizeUI.bigTitle, fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }

  Widget _keyCard(String text, String image) {
    return GestureDetector(
      onTap: () {
        var platform = PlatformInformation(name: text, image: image);

        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => Platform(platform))));
      },
      child: Card(
        elevation: 1,
        shadowColor: ColorUI.primaryColor,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          SpaceUI.x15, SpaceUI.x0, SpaceUI.x15, SpaceUI.x0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(image),
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Icon(Icons.settings)
            ],
          ),
        ),
      ),
    );
  }

  Widget _keyList() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          SpaceUI.x15, SpaceUI.x70, SpaceUI.x15, SpaceUI.x0),
      child: Wrap(
        runSpacing: SpaceUI.x15,
        children: [
          Row(
            children: [
              Text(
                "Suas Chaves:",
                style: TextStyle(
                    fontSize: TextSizeUI.title, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _keyCard("Hackerone", "assets/hackerone.png"),
          _keyCard("Intigriti", "assets/intigriti.png")
        ],
      ),
    );
  }
}
