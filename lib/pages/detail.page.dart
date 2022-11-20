import 'dart:ui';

import 'package:bug_hunter_news/components/badge.widget.dart';
import 'package:bug_hunter_news/components/price.badge.widget.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:bug_hunter_news/constants/tools.dart';
import 'package:bug_hunter_news/controllers/program.controller.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:bug_hunter_news/widgets/sub.title.widget.dart';
import 'package:bug_hunter_news/widgets/title.widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.program);

  Program program;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<int> scopeAutomate = [];
  List<int> tools = [Tools.Nmap, Tools.Whois, Tools.Subfind3r];

  ProgramController programController = new ProgramController();

  Widget badge(String item, Color color, {double padding: 6}) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Text(
        "$item",
        style: TextStyle(
          color: color,
          fontFamily: 'roboto',
        ),
      ),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }

  Widget _Dialog(context, String title, String description) {
    return Center(
      child: AlertDialog(
        title: Text("$title"),
        content: Text("$description"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Widget customDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(
          child: Divider(
            indent: 20.0,
            endIndent: 10.0,
            thickness: 1,
          ),
        ),
        Text(
          "Tecnologias",
          style: TextStyle(color: Colors.grey),
        ),
        Expanded(
          child: Divider(
            indent: 10.0,
            endIndent: 20.0,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  List<Widget> scopes() {
    List<Widget> items = [];
    // scopeAutomate = [];

    widget.program.scopes.forEach((element) {
      List<Widget> tecnologies = [];

      element["tecnologies"].forEach(
          (tech) => tecnologies.add(badge(tech, Colors.grey, padding: 4)));

      Widget scope = Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            10.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Checkbox(
                            value: scopeAutomate.contains(element["id"]),
                            onChanged: (val) {
                              setState(() {
                                scopeAutomate.contains(element["id"])
                                    ? scopeAutomate.remove(element["id"])
                                    : scopeAutomate.add(element["id"]);

                                // print(scopeAutomate);
                              });
                            }),
                        Text(
                          "${element['target']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (element["gravity"] == "CRITICAL")
                    badge(element["gravity"], Colors.red, padding: 4)
                  else if (element["gravity"] == "LOW")
                    badge(element["gravity"], Colors.yellow, padding: 4)
                  else
                    badge(element["gravity"], Colors.blue, padding: 4)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: customDivider(),
              ),
              Wrap(
                children: tecnologies.isEmpty ? [] : tecnologies,
              )
            ],
          ),
        ),
      );

      items.add(scope);
    });

    return items;
  }

  Future<void> launchUrlOnClick({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  void automateTools() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: AlertDialog(
            title: Text("Selecione a ferramenta"),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                                value: tools.contains(Tools.Nmap),
                                onChanged: (val) {
                                  setState(() {
                                    tools.contains(Tools.Nmap)
                                        ? tools.remove(Tools.Nmap)
                                        : tools.add(Tools.Nmap);
                                    print(tools);
                                  });
                                }),
                            Text("Nmap")
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                                value: tools.contains(Tools.Whois),
                                onChanged: (val) {
                                  setState(() {
                                    tools.contains(Tools.Whois)
                                        ? tools.remove(Tools.Whois)
                                        : tools.add(Tools.Whois);
                                    print(tools);
                                  });
                                }),
                            Text("Whois")
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                                value: tools.contains(Tools.Subfind3r),
                                onChanged: (val) {
                                  setState(() {
                                    tools.contains(Tools.Subfind3r)
                                        ? tools.remove(Tools.Subfind3r)
                                        : tools.add(Tools.Subfind3r);
                                    print(tools);
                                  });
                                }),
                            Text("Subfind3r")
                          ],
                        ),
                      ),
                      Visibility(
                        visible: tools.isEmpty,
                        child: Text(
                          "Selecione ao menos uma ferramenta",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () {
                  tools = [Tools.Nmap, Tools.Whois, Tools.Subfind3r];
                  Navigator.pop(context, 'Cancel');
                },
                child: Text("Fechar"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Automatizar"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: ColorUI.primaryColor,
          elevation: 0.0,
          titleSpacing: 0,
          iconTheme: IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/home_user", (Route<dynamic> route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                setState(() {
                  widget.program.favorite = !widget.program.favorite!;
                });

                if (widget.program.favorite!)
                  return await programController.favorite(widget.program.id!);

                await programController.unfavorite(widget.program.id!);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    widget.program.favorite!
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded,
                    color: Colors.red,
                    size: 25,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: ColorUI.primaryColor,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(3), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image.network(widget.program.image!,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: SubTitleWidget(
                              title: widget.program.title!,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                badge(widget.program.platform_name!,
                                    Colors.white),
                                GestureDetector(
                                  onTap: () async {
                                    launchUrlOnClick(url: widget.program.link!);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.visibility_outlined,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 3),
                                        Text("Ver no browser"),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                badge(
                                  widget.program.private!
                                      ? "Privado"
                                      : "Público",
                                  Colors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 13, bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubTitleWidget(
                                  title: "Descrição".toUpperCase(),
                                ),
                                Text(
                                  "Lançado em ${widget.program.launch!}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.program.description!,
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'roboto',
                                fontSize: 15,
                              ),
                            ),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SubTitleWidget(
                              title: "Pagamentos".toUpperCase(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              badge(
                                "Low ${widget.program.low_min}",
                                Colors.orangeAccent,
                              ),
                              badge(
                                "Medium ${widget.program.medium_min}",
                                Colors.green,
                              ),
                              badge(
                                "High ${widget.program.high_min}",
                                Colors.redAccent,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SubTitleWidget(
                              title: "Escopo".toUpperCase(),
                            ),
                          ),
                          ...scopes()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    if (scopeAutomate.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => _Dialog(
                              context,
                              "Atenção",
                              "Selecione pelo meno 1 alvo no escopo."));
                    } else {
                      automateTools();
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assistant_photo_outlined,
                            size: SpaceUI.x35,
                            color: Colors.white,
                          ),
                          Text(
                            "Realizar reconhecimento",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: SpaceUI.x20),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: ColorUI.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
