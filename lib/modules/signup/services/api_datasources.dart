import 'package:dio/dio.dart';
import 'package:mesa_news_challenge/modules/signup/data/datasources/signup_datasources.dart';
import 'package:mesa_news_challenge/modules/signup/data/models/signup_model.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';
import 'package:mesa_news_challenge/modules/signup/domain/errors/errors.dart';
import 'package:mesa_news_challenge/services/api_service.dart';

class ApiDataSource implements SignupDataSource {
  final ApiService apiService;

  ApiDataSource(this.apiService);

  @override
  Future<Signup> signup(Signup user) async {
    try {
      final response = await apiService.signupUser(user);
      print("response $response");
      return SignupModel.fromMap(response.data);
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');
      throw FailureSignup(message: "");
    }
  }
}
