import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/controller/signup_controller.dart';
import 'presenter/signup_page.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<SignupModule>.of();
}
