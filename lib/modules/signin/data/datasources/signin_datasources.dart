import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';

abstract class SigninDataSource {
  Future<Signin> signin(Signin user);
}
