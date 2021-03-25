import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/home/data/repositories/home_repository_impl.dart';
import 'package:mesa_news_challenge/modules/home/domain/usecases/get_news_highlight_usecase.dart';
import 'package:mesa_news_challenge/modules/home/domain/usecases/get_news_usecase.dart';
import 'package:mesa_news_challenge/modules/home/presenter/home_controller.dart';
import 'package:mesa_news_challenge/modules/home/services/api_datasources.dart';

import 'presenter/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i(), i())),
        Bind((i) => ApiDataSource(i())),
        Bind((i) => HomeRepositoryImpl(i())),
        Bind((i) => GetNewsUseCaseImpl(i())),
        Bind((i) => GetNewsHighlightUseCaseImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
