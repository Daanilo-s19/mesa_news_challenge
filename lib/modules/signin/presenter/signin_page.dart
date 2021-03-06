import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mesa_news_challenge/enum/mesa_button_type.dart';
import 'package:mesa_news_challenge/modules/signin/presenter/controller/signin_controller.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_default_widget.dart';
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
    return Observer(
      builder: (_) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: MesaAppBarDefaultWidget(
            title: "Entrar com e-mail",
          ),
        ),
        body: Column(
          children: [
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
                    errorText: controller.errorEmail && controller.isFormError
                        ? "Preencha o seu email"
                        : null,
                    onChanged: (value) => controller.setUser(
                      controller.user.copyWith(email: value),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 32),
                    child: MesaTextFieldDefaultWidget(
                      label: "Senha",
                      errorText:
                          controller.errorPassword && controller.isFormError
                              ? "Preencha a sua senha"
                              : null,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (value) => controller.setUser(
                        controller.user.copyWith(password: value),
                      ),
                    ),
                  ),
                  MesaButtonDefaultWidget(
                    text: "Login",
                    type: controller.loading
                        ? MesaButtonType.LOADING
                        : controller.buttonType,
                    onPressed:
                        !controller.loading ? controller.signinUser : () {},
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
                      type: controller.loadingFb
                          ? MesaButtonType.LOADING
                          : MesaButtonType.PRIMARY,
                      onPressed: !controller.loadingFb
                          ? controller.signinWithFacebook
                          : () {},
                    ),
                  ),
                  MesaFooterDefaultWidget(
                    text: "N??o tenho conta. ",
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
      ),
    );
  }
}
