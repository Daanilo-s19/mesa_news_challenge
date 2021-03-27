import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mesa_news_challenge/app/data/models/user_model.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/app/presenter/controller/app_controller.dart';
import 'package:mesa_news_challenge/modules/signin/data/datasources/signin_datasources.dart';
import 'package:mesa_news_challenge/modules/signin/data/models/signin_model.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signup/data/models/signup_model.dart';
import 'package:mesa_news_challenge/services/api_service.dart';

class ApiDataSource implements SigninDataSource {
  final AppController appController;

  ApiDataSource(this.appController);

  @override
  Future<UserMesa> signin(Signin user) async {
    try {
      final response = await appController.apiService.signinUser(user);
      return UserMesaModel.fromMap(response.data);
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');
      throw FailureSignin(message: ex.response.data["message"]);
    }
  }

  @override
  Future<UserMesa> signinWithFacebook() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential fb;
    try {
      final fbLogin = FacebookLogin();
      final resultFb = await fbLogin.logIn(['email']);

      switch (resultFb.status) {
        case FacebookLoginStatus.loggedIn:
          final FacebookAccessToken accessToken = resultFb.accessToken;
          AuthCredential credential =
              FacebookAuthProvider.credential(accessToken.token);
          fb = await _auth.signInWithCredential(credential);
          //TODO: Não é o ideal passar o uid como senha. O correto é enviar o token para a api retornando o token de autenticação;
          final response = await appController.apiService.signinUser(
            SigninModel(email: fb.user.email, password: fb.user.uid),
          );
          return UserMesaModel.fromMap(response.data);
        case FacebookLoginStatus.cancelledByUser:
          return throw FailureSignin(message: "cancelledByUser");
        default:
          throw FailureSignin(message: "failure Facebook login");
      }
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');

      if (ex.response.statusCode == 401) {
        final response = await appController.apiService.signupUser(
          SignupModel(
            email: fb.user.email,
            password: fb.user.uid,
            name: fb.user.displayName,
          ),
        );

        if (response.statusCode == 200) {
          return UserMesaModel.fromMap(response.data);
        } else {
          throw FailureSignin(message: ex.response.data["message"]);
        }
      }
      throw FailureSignin(message: ex.response.data["message"]);
    }
  }
}
