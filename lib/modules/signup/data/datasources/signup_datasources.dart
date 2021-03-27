import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';

abstract class SignupDataSource {
  Future<UserMesa> signup(Signup user);
}
