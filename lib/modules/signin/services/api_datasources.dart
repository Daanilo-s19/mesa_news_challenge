import 'package:dio/dio.dart';
import 'package:mesa_news_challenge/app/data/models/user_model.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/app/presenter/controller/app_controller.dart';
import 'package:mesa_news_challenge/modules/signin/data/datasources/signin_datasources.dart';
import 'package:mesa_news_challenge/modules/signin/data/models/signin_model.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/services/api_service.dart';

class ApiDataSource implements SigninDataSource {
  final AppController appController;

  ApiDataSource(this.appController);

  @override
  Future<User> signin(Signin user) async {
    try {
      final response = await appController.apiService.signinUser(user);
      print("response $response");
      return UserModel.fromMap(response.data);
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');
      throw FailureSignin(message: ex.response.data["message"]);
    }
  }
}
