import 'package:bug_hunter_news/controllers/user.platform.controller.dart';
import 'package:bug_hunter_news/model/platform.information.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:flutter/material.dart';

import 'package:bug_hunter_news/widgets/custom.app.bar.widget.dart';

class Platform extends StatefulWidget {
  PlatformInformation platform;

  Platform(this.platform);

  @override
  State<Platform> createState() => _PlatformState();
}

class _PlatformState extends State<Platform> {
  var visibleKey = false;
  var isToUpdate = false;
  Widget keyIcon = Icon(Icons.visibility_off);

  var tokenController = TextEditingController();

  var userPlatformController = UserPlatform();

  void initState() {
    setCurrentToken();
    super.initState();
  }

  void changeVisibility() {
    setState(() {
      visibleKey = !visibleKey;
      keyIcon =
          visibleKey ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
    });
  }

  void setCurrentToken() async {
    var response = await userPlatformController.read(widget.platform.id);
    isToUpdate = !response["data"].isEmpty;

    if (isToUpdate) {
      setState(() {
        tokenController.text = response["data"][0]["api_key"];
      });
    }
  }

  Widget _DialogAlert(context, String title, String description) {
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

  void saveToken() async {
    if (tokenController.text.isEmpty) {
      return showDialog(
          context: context,
          builder: (context) => _DialogAlert(
              context, "Atenção", "Preencha um token para salvar."));
    }

    var response = isToUpdate
        ? await userPlatformController.update(
            widget.platform.id!, tokenController.text)
        : await userPlatformController.create(
            widget.platform.id!, tokenController.text);

    isToUpdate = isToUpdate ? response["updated"] : response["created"];

    return showDialog(
        context: context,
        builder: (context) =>
            _DialogAlert(context, "Atenção", response["message"]));
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () => saveToken(),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 15, left: 25, right: 25, top: 35),
              decoration: BoxDecoration(
                color: ColorUI.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: ColorUI.primaryColor.withOpacity(0.5),
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
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.save,
                      size: TextSizeUI.title,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Salvar Token",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TextSizeUI.medium,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _Dialog(context) {
    return Center(
      child: AlertDialog(
        title: const Text('Como cadastrar uma chave?'),
        content: Expanded(
          child: Text(
              'Para cadastrar uma chave você precisa acessar a sua plataforma de bug bounty gerar o seu token e colar no campo disponível!'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Widget _Footer() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(45),
            child: Wrap(
              spacing: 5,
              children: [
                Text(
                  "Dúvida?",
                  style: TextStyle(fontSize: TextSizeUI.medium),
                ),
                GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => _Dialog(context)),
                  child: Text("Clique Aqui".toUpperCase(),
                      style: TextStyle(
                          color: ColorUI.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: TextSizeUI.medium)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CustomAppBar(title: "Sua chave"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("${widget.platform.image}"),
                    ),
                    Text(
                      "${widget.platform.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: tokenController,
                        obscureText: !visibleKey,
                        decoration: InputDecoration(
                            label: Text("Chave"),
                            suffixIcon: IconButton(
                              icon: keyIcon,
                              onPressed: changeVisibility,
                            )),
                      ),
                    ),
                    saveButton()
                  ],
                ),
              ),
            ),
            _Footer()
          ],
        ));
  }
}
