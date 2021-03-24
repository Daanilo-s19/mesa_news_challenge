import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/signup/services/api_datasources.dart';
import 'data/repositories/signup_repository.dart';
import 'domain/usecases/signup_user_usecase.dart';
import 'presenter/controller/signup_controller.dart';
import 'presenter/signup_page.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ApiDataSource(i())),
        Bind((i) => SignupRepositoryImpl(i())),
        Bind((i) => SignupUserUseCaseImpl(i())),
        Bind((i) => SignupController(i(), i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<SignupModule>.of();
}
