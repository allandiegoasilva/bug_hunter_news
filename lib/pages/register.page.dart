import 'dart:convert';

import 'package:bug_hunter_news/constants/api_route.dart';
import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/constants/status.code.dart';
import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:bug_hunter_news/controllers/user.controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bug_hunter_news/model/User.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _hiddenPassword = true;

  var userController = UserController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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

  void register() async {
    var user = User(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    var response = await userController.register(user);

    if (response["registered"]) {
      var sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", response["token"]);
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/home_user', (Route<dynamic> route) => false);

      return;
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            _Dialog(context, "Atenção", response["message"]));
  }

  void validateFields() {
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) return register();

    showDialog(
        context: context,
        builder: (BuildContext context) =>
            _Dialog(context, "Atenção", "Verifique os campos inválidos."));
  }

  Widget emailInput() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "E-mail",
          labelText: "E-mail",
          prefixIcon: Icon(Icons.email_outlined)),
    );
  }

  Widget passwordInput() {
    return TextField(
      controller: passwordController,
      obscureText: _hiddenPassword,
      decoration: InputDecoration(
          hintText: "Senha",
          labelText: "Senha",
          prefixIcon: Icon(Icons.key_outlined),
          suffixIcon: IconButton(
            icon: Icon(_hiddenPassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
            onPressed: () => setState(() => _hiddenPassword = !_hiddenPassword),
          )),
    );
  }

  Widget registerBtn() {
    return GestureDetector(
      onTap: validateFields,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(SpaceUI.x15),
        decoration: BoxDecoration(
            color: ColorUI.primaryColor,
            borderRadius: BorderRadius.circular(SpaceUI.borderRadiusx20)),
        child: Center(
          child: Text(
            "Registrar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _FormUI() {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: SpaceUI.x20, horizontal: SpaceUI.x35),
        child: Wrap(
          spacing: SpaceUI.spacingx20,
          runSpacing: SpaceUI.runSpacingx20,
          children: [emailInput(), passwordInput(), registerBtn()],
        ));
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
                  "Já tem uma conta?",
                  style: TextStyle(fontSize: TextSizeUI.medium),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil("/login", (route) => false),
                  child: Text("Acessar".toUpperCase(),
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Cadastrar-se",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        SpaceUI.x20, SpaceUI.x35, SpaceUI.x20, SpaceUI.x20),
                    child: Wrap(
                      spacing: SpaceUI.spacingx10,
                      runSpacing: SpaceUI.runSpacingx10,
                      children: [
                        Center(
                          child: Text(
                            "Crie a sua conta",
                            style: TextStyle(
                                fontSize: TextSizeUI.bigTitle,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            "e automatize seus programas de Bug Bounty",
                            style: TextStyle(
                                color: Colors.indigoAccent,
                                fontSize: TextSizeUI.small),
                          ),
                        )
                      ],
                    ),
                  ),
                  _FormUI(),
                  _Footer()
                ]),
          )
        ],
      ),
    );
  }
}
