import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';

abstract class SigninDataSource {
  Future<User> signin(Signin user);
}
