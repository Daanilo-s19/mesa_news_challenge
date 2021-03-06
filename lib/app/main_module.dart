import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/app/presenter/controller/user_controller.dart';
import 'package:mesa_news_challenge/modules/home/home_module.dart';
import 'package:mesa_news_challenge/modules/onboarding/onboarding_module.dart';
import 'package:mesa_news_challenge/modules/splash/splash_page.dart';
import 'package:mesa_news_challenge/services/api_service.dart';
import 'presenter/app_widget.dart';
import 'presenter/controller/app_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ApiService()),
        Bind((i) => UserController()),
        Bind((i) => AppController(i(), i())),
        ...OnboardingModule().binds,
        ...HomeModule().binds,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => SplashPage()),
        ModularRouter(
          "/onboarding",
          module: OnboardingModule(),
          duration: Duration(milliseconds: 500),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          "/home",
          module: HomeModule(),
          duration: Duration(milliseconds: 500),
          transition: TransitionType.scale,
        ),
      ];

  static Inject get to => Inject<AppModule>.of();

  @override
  Widget get bootstrap => AppWidget();
}
