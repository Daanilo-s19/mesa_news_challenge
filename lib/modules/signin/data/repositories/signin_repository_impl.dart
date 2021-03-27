import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/data/datasources/signin_datasources.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';

class SigninRepositoryImpl implements SigninRepository {
  final SigninDataSource dataSource;

  SigninRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureSignin, UserMesa>> signin(Signin user) async {
    if (user == null || user.email == null || user.password == null) {
      return Left(FailureSignin());
    }
    try {
      final result = await dataSource.signin(user);
      return Right(result);
    } on FailureSignin catch (e) {
      return Left(FailureSignin(message: e.message));
    }
  }

  @override
  Future<Either<FailureSignin, UserMesa>> signinWithFacebook() async {
    try {
      final result = await dataSource.signinWithFacebook();
      return Right(result);
    } on FailureSignin catch (e) {
      return Left(FailureSignin(message: e.message));
    }
  }
}
