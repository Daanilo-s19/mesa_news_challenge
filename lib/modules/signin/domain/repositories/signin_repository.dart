import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';

abstract class SigninRepository {
  Future<Either<FailureSignin, Signin>> signin(Signin user);
}
