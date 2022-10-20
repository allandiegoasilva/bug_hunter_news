import 'package:bug_hunter_news/constants/color_ui.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/constants/text_size_ui.dart';
import 'package:bug_hunter_news/pages/register.page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _obscureTextPassword = true;

  Widget _LogoUi() {
    return Container(
      padding:
          EdgeInsets.fromLTRB(SpaceUI.x0, SpaceUI.x70, SpaceUI.x0, SpaceUI.x70),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Image.asset(
          "assets/icon.jpeg",
          fit: BoxFit.contain,
          height: 150,
          width: 150,
        ),
      ),
    );
  }

  // inputs
  Widget emailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
          hintText: "E-mail",
          labelText: "E-mail",
          prefixIcon: Icon(Icons.email_outlined)),
    );
  }

  Widget passwordInput() {
    return TextField(
      obscureText: _obscureTextPassword,
      decoration: InputDecoration(
          hintText: "Senha",
          labelText: "Senha",
          prefixIcon: Icon(Icons.key_outlined),
          suffixIcon: IconButton(
            icon: Icon(_obscureTextPassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
            onPressed: () => setState(() {
              _obscureTextPassword = !_obscureTextPassword;
            }),
          )),
    );
  }

  Widget btnLogin() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, "/home_user", (Route<dynamic> route) => false);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(SpaceUI.x15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SpaceUI.borderRadiusx20),
            color: ColorUI.primaryColor,
          ),
          child: Center(
            child: Text(
              "Entrar",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          runSpacing: SpaceUI.runSpacingx20,
          spacing: SpaceUI.spacingx20,
          children: [emailInput(), passwordInput(), btnLogin()],
        ));
  }

  Widget _FooterUI() {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(45),
          child: Wrap(
            spacing: 5,
            children: [
              Text(
                "Não tem uma conta?",
                style: TextStyle(fontSize: TextSizeUI.medium),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/register"),
                child: Text(
                  "Cadastrar-se".toUpperCase(),
                  style: TextStyle(
                      color: ColorUI.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: TextSizeUI.medium),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                children: [
                  _LogoUi(),
                  _FormUI(),
                  _FooterUI(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
