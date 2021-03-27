import 'package:dio/dio.dart';
import 'package:mesa_news_challenge/app/data/models/user_model.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/app/presenter/controller/app_controller.dart';
import 'package:mesa_news_challenge/modules/signup/data/datasources/signup_datasources.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';
import 'package:mesa_news_challenge/modules/signup/domain/errors/errors.dart';

class ApiDataSource implements SignupDataSource {
  final AppController appController;

  ApiDataSource(this.appController);

  @override
  Future<UserMesa> signup(Signup user) async {
    try {
      final response = await appController.apiService.signupUser(user);
      return UserMesaModel.fromMap(response.data);
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');
      throw FailureSignup(message: ex.response.data["message"]);
    }
  }
}
