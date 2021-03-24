import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/onboardingPage/presenter/onboarding_page.dart';
import 'package:mesa_news_challenge/modules/signinPage/signin_module.dart';
import 'package:mesa_news_challenge/modules/signupPage/signup_module.dart';

class OnboardingModule extends ChildModule {
  @override
  List<Bind> get binds => [
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
