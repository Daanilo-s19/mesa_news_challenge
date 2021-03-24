import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/themes/light_theme.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Mesa News Challenge",
      initialRoute: "/",
      navigatorKey: Modular.navigatorKey,
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
      theme: lightTheme,
    );
  }
}
