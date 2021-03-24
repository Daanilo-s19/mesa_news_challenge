import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/animation/animation_size_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_default_widget.dart';
import 'package:mesa_news_challenge/widgets/footer/footer_default_widget.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _active = false;
  double _height = 0;
  int animationTimerMs = 300;
  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  initAnimation() {
    Timer(Duration(milliseconds: animationTimerMs), () {
      setState(() {
        _active = true;
        _height = 247;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MesaColorsGuide.PRIMARY,
      body: Container(
        margin: EdgeInsets.only(top: 230),
        child: Column(
          children: [
            AnimatedContainer(
                duration: Duration(milliseconds: animationTimerMs),
                alignment: _active ? Alignment(0, -.3) : Alignment(0, 0),
                child: SvgPicture.asset("assets/logo.svg")),
            AnimatedOpacity(
              duration: Duration(milliseconds: animationTimerMs * 2),
              opacity: _active ? 1 : 0,
              child: Container(
                margin: EdgeInsets.only(top: 18),
                child: Text(
                  "NEWS",
                  style:
                      MesaTextStyleGuide.title01.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MesaAnimationSizeWidget(
          duration: Duration(milliseconds: animationTimerMs),
          height: _height,
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MesaButtonDefaultWidget(
                  text: "Entrar com facebook",
                  textStyle: MesaTextStyleGuide.button
                      .copyWith(color: MesaColorsGuide.LINK),
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 40),
                  child: MesaButtonDefaultWidget(
                    text: "Entrar com e-mail",
                    onPressed: () => Modular.to.pushNamed("onboarding/signin"),
                    border: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                MesaFooterDefaultWidget(
                  text: "Não tenho conta. ",
                  textLink: "Cadastrar",
                  onTap: () => Modular.to.pushNamed("onboarding/signup"),
                ),
              ],
            ),
          )),
    );
  }
}
