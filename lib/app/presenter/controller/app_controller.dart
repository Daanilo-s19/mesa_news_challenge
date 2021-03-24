import 'package:mesa_news_challenge/app/presenter/controller/user_controller.dart';
import 'package:mesa_news_challenge/services/api_service.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final UserController userController;
  final ApiService apiService;

  _AppControllerBase(this.userController, this.apiService);
}
