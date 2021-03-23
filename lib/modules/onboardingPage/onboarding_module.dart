import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/onboardingPage/presenter/onboarding_page.dart';

class OnboardingModule extends ChildModule {
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => OnboardingPage()),
      ];

  static Inject get to => Inject<OnboardingModule>.of();
}
