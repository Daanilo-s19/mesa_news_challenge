import 'package:dio/dio.dart';
import 'package:mesa_news_challenge/modules/signin/data/datasources/signin_datasources.dart';
import 'package:mesa_news_challenge/modules/signin/data/models/signin_model.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/services/api_service.dart';

class ApiDataSource implements SigninDataSource {
  final ApiService apiService;

  ApiDataSource(this.apiService);

  @override
  Future<Signin> signin(Signin user) async {
    try {
      final response = await apiService.signinUser(user);
      return SigninModel.fromMap(response.data);
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');
      throw FailureSignin(message: "");
    }
  }
}
