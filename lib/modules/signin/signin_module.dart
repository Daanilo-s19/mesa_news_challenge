import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/signin/data/repositories/signin_repository_impl.dart';
import 'package:mesa_news_challenge/modules/signin/domain/usecases/signin_user_usecase.dart';
import 'package:mesa_news_challenge/modules/signin/presenter/signin_page.dart';

import 'presenter/controller/signin_controller.dart';
import 'services/api_datasources.dart';

class SigninModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ApiDataSource(i())),
        Bind((i) => SigninRepositoryImpl(i())),
        Bind((i) => SigninUserUseCaseImpl(i())),
        Bind((i) => SigninController(i(), i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => SigninPage()),
      ];

  static Inject get to => Inject<SigninModule>.of();
}
