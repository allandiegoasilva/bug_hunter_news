import 'package:bug_hunter_news/components/body.white.area.widget.dart';
import 'package:bug_hunter_news/components/body.widget.dart';
import 'package:bug_hunter_news/pages/platform.page.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:flutter/material.dart';
import 'package:bug_hunter_news/model/platform.information.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      title: "Perfil",
      body: Column(
        children: [
          _money(),
          BodyWhiteAreaWidget(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: _keyList(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 35),
                  child: GestureDetector(
                    onTap: () async {
                      var sharedPreferences =
                          await SharedPreferences.getInstance();
                      await sharedPreferences.remove("token");
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route<dynamic> route) => false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.redAccent.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Desconectar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: TextSizeUI.medium,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.logout,
                              size: TextSizeUI.title,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorUI.lightGray.withOpacity(1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text(
                  "R\$ 0,00",
                  style: TextStyle(
                      color: ColorUI.primaryColor,
                      fontSize: TextSizeUI.bigTitle,
                      fontWeight: FontWeight.bold),
                ))
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
