import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/onboarding/presenter/onboarding_controller.dart';
import 'package:mesa_news_challenge/modules/onboarding/presenter/onboarding_page.dart';
import 'package:mesa_news_challenge/modules/signin/signin_module.dart';
import 'package:mesa_news_challenge/modules/signup/signup_module.dart';

class OnboardingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OnboardingController(i())),
        ...SigninModule().binds,
        ...SignupModule().binds,
      ];
  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => OnboardingPage()),
        ModularRouter("/signin",
            module: SigninModule(),
            duration: Duration(milliseconds: 500),
            transition: TransitionType.downToUp),
        ModularRouter("/signup",
            module: SignupModule(),
            duration: Duration(milliseconds: 500),
            transition: TransitionType.downToUp),
      ];

  static Inject get to => Inject<OnboardingModule>.of();
}
