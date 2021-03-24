import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';

abstract class SignupDataSource {
  Future<Signup> signup(Signup user);
}
