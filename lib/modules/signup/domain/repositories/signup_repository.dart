import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';
import 'package:mesa_news_challenge/modules/signup/domain/errors/errors.dart';

abstract class SignupRepository {
  Future<Either<FailureSignup, Signup>> signup(Signup user);
}
