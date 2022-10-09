
import 'package:bug_hunter_news/core/color_ui.dart';
import 'package:bug_hunter_news/core/space_ui.dart';
import 'package:bug_hunter_news/core/text_size_ui.dart';
import 'package:flutter/material.dart'; 


class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}


class _RegisterPage extends State<RegisterPage>{

  bool _hiddenPassword = true; 
  bool _acceptedTerms = false; 

  Widget emailInput(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "E-mail",
        labelText: "E-mail",
        prefixIcon: Icon(
          Icons.email_outlined
        )
      ),
    );
  }

  Widget passwordInput(){
    return TextField(
      obscureText: _hiddenPassword,
      decoration: InputDecoration(
        hintText: "Senha",
        labelText: "Senha",
        prefixIcon: Icon(
          Icons.key_outlined
        ),
        suffixIcon: IconButton(
          icon: Icon(
          _hiddenPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined
          ),
          onPressed: () => setState(() => _hiddenPassword = !_hiddenPassword),
        )
      ),
    );
  }

  Widget registerBtn(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(SpaceUI.x15),
        decoration: BoxDecoration(
          color: ColorUI.primaryColor,
          borderRadius: BorderRadius.circular(SpaceUI.borderRadiusx20)
        ),
        child: Center(
          child: Text("Registrar", 
           style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
           ),
          ),
        ),
      ),
    );
  }

  Widget checkBoxTerms(){
    return Row(
      children: [
        Checkbox(
        activeColor: ColorUI.primaryColor,
         value: _acceptedTerms,
         onChanged: (bool? isChecked){
          setState(() {
            _acceptedTerms = isChecked!; 
          }); 
        }),
        Text("Concordo que li e aceitei os termos de uso")
      ],
    );
  }

  Widget _FormUI(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: SpaceUI.x20, horizontal: SpaceUI.x35),
      child: Wrap(
        spacing: SpaceUI.spacingx20,
        runSpacing: SpaceUI.runSpacingx20,
        children: [
          emailInput(),
          passwordInput(),
          checkBoxTerms(),                         
          registerBtn()
        ],
      )
    );
  }

  Widget _Footer(){
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
                Text("Já tem uma conta?",
                  style: TextStyle(
                    fontSize: TextSizeUI.medium
                  ),
                ),
                GestureDetector(
                  onTap: () =>  Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false), 
                  child: Text(
                    "Acessar".toUpperCase(),
                    style: TextStyle(
                      color: ColorUI.primaryColor, 
                      fontWeight: FontWeight.bold,
                      fontSize: TextSizeUI.medium
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Cadastrar-se",
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
                    padding: EdgeInsets.fromLTRB(SpaceUI.x20, SpaceUI.x35, SpaceUI.x20, SpaceUI.x20),
                    child: Wrap(
                      spacing: SpaceUI.spacingx10,
                      runSpacing: SpaceUI.runSpacingx10,
                      children: [
                        Center(
                          child: Text("Crie a sua conta", 
                            style: TextStyle(
                              fontSize: TextSizeUI.bigTitle,
                              fontWeight: FontWeight.bold
                            ), 
                          ),
                        ),
                        Center(
                          child: Text("e automatize seus programas de Bug Bounty", 
                          style: TextStyle(
                            color: Colors.indigoAccent, 
                            fontSize: TextSizeUI.small
                          ),
                         ),
                        )
                      ],
                    ),
                  ),
                  _FormUI(), 
                  _Footer()
                ]
              ),
            )
          ],
        ),
    );
  }
}
