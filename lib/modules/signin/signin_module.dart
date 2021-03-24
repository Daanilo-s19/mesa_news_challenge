import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/signin/presenter/signin_page.dart';

import 'presenter/controller/signin_controller.dart';

class SigninModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SigninController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => SigninPage()),
      ];

  static Inject get to => Inject<SigninModule>.of();
}
