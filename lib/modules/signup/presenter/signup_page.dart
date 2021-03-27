import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/enum/mesa_button_type.dart';
import 'package:mesa_news_challenge/utils/mesa_utils.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_default_widget.dart';
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
    return Observer(
      builder: (_) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: MesaAppBarDefaultWidget(
            title: "Cadastrar",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 26, top: 24),
                    child: MesaTextFieldDefaultWidget(
                      label: "Nome",
                      errorText: controller.errorName && controller.isFormError
                          ? "Seu nome é importante para nós!"
                          : null,
                      onChanged: (value) => controller.setNewUser(
                        controller.newUser.copyWith(name: value),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 26),
                    child: MesaTextFieldDefaultWidget(
                      label: "E-mail",
                      errorText: controller.errorEmail && controller.isFormError
                          ? "É preciso um email válido!"
                          : null,
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
                      errorText:
                          controller.errorPassword && controller.isFormError
                              ? "A senha precisa ter no mínimo 6 digitos"
                              : null,
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
                      errorText: controller.errorConfirmPassword &&
                              controller.isFormError
                          ? "A senha não é igual"
                          : null,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (value) => controller.setNewUser(
                        controller.newUser.copyWith(confirmPassword: value),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 32),
                    child: MesaTextFieldDefaultWidget(
                      label: "Data de nascimento - opcional",
                      keyboardType: TextInputType.datetime,
                      maskFormatter: [MesaUtils.phoneFormatter],
                      onChanged: (value) => controller.setNewUser(
                        controller.newUser
                            .copyWith(birthday: DateTime.parse(value)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: MesaButtonDefaultWidget(
            text: "cadastrar",
            type: controller.buttonType,
            onPressed: controller.buttonType != MesaButtonType.LOADING
                ? controller.signupUser
                : () {},
          ),
        ),
      ),
    );
  }
}
