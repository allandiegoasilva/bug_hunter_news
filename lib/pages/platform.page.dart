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
  Widget keyIcon = Icon(Icons.visibility_off);

  void changeVisibility() {
    setState(() {
      visibleKey = !visibleKey;
      keyIcon =
          visibleKey ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
    });
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
            Expanded(
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
                        obscureText: !visibleKey,
                        decoration: InputDecoration(
                            label: Text("Chave"),
                            suffixIcon: IconButton(
                              icon: keyIcon,
                              onPressed: changeVisibility,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _Footer()
          ],
        ));
  }
}
