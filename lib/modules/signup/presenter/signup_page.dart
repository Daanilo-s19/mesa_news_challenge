import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';
import 'package:mesa_news_challenge/widgets/textField/textfield_default_widget.dart';

import 'controller/signup_controller.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MesaAppBarDefaultWidget(
            prefix: MesaIconButtonWidget(),
            title: "Cadastrar",
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 26, top: 24),
                  child: MesaTextFieldDefaultWidget(
                    label: "Nome",
                    onChanged: (value) => controller.setNewUser(
                      controller.newUser.copyWith(name: value),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 26),
                  child: MesaTextFieldDefaultWidget(
                    label: "E-mail",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => controller.setNewUser(
                      controller.newUser.copyWith(email: value),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 26),
                  child: MesaTextFieldDefaultWidget(
                    label: "Senha",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) => controller.setNewUser(
                      controller.newUser.copyWith(password: value),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 26),
                  child: MesaTextFieldDefaultWidget(
                    label: "Confirmar senha",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) => controller.setNewUser(
                      controller.newUser.copyWith(password: value),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 32),
                  child: MesaTextFieldDefaultWidget(
                    label: "Data de nascimento - opcional",
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) => controller.setNewUser(
                      controller.newUser.copyWith(password: value),
                    ),
                  ),
                ),
                MesaButtonDefaultWidget(
                  text: "cadastrar",
                  onPressed: controller.signupUser,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
