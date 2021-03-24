import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  final int _splashTimer = 3000;

  void navigationToNextPage() async {
    Modular.to.pushReplacementNamed('/onboarding');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(milliseconds: _splashTimer);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: MesaColorsGuide.PRIMARY));
    //If you want to set the font size is scaled according to the system's "font size" assist option

    return Scaffold(
      backgroundColor: MesaColorsGuide.PRIMARY,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/logo.svg")),
        ],
      ),
    );
  }
}
