import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mesa_news_challenge/modules/signin/presenter/controller/signin_controller.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';
import 'package:mesa_news_challenge/widgets/footer/footer_default_widget.dart';
import 'package:mesa_news_challenge/widgets/textField/textfield_default_widget.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends ModularState<SigninPage, SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MesaAppBarDefaultWidget(
            prefix: MesaIconButtonWidget(),
            title: "Entrar com e-mail",
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                    bottom: 55,
                  ),
                  child: SvgPicture.asset("assets/login.svg"),
                ),
                MesaTextFieldDefaultWidget(
                  label: "Login",
                  onChanged: (value) => controller.setSignin(
                    controller.signin.copyWith(email: value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 32),
                  child: MesaTextFieldDefaultWidget(
                    label: "Senha",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) => controller.setSignin(
                      controller.signin.copyWith(password: value),
                    ),
                  ),
                ),
                MesaButtonDefaultWidget(
                  text: "Login",
                  onPressed: controller.signinUser,
                ),
                Container(
                  margin: EdgeInsets.only(top: 134, bottom: 24),
                  child: MesaButtonDefaultWidget(
                    text: "Entrar com facebook",
                    backgroundColor: Colors.white,
                    textStyle: MesaTextStyleGuide.button
                        .copyWith(color: MesaColorsGuide.PRIMARY),
                    border:
                        BorderSide(width: 1, color: MesaColorsGuide.PRIMARY),
                    onPressed: () {},
                  ),
                ),
                MesaFooterDefaultWidget(
                  text: "Não tenho conta. ",
                  textStyle: MesaTextStyleGuide.heading02
                      .copyWith(color: MesaColorsGuide.PRIMARY),
                  textLink: "Cadastrar",
                  onTap: () => Modular.to.pushNamed("onboarding/signup"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
