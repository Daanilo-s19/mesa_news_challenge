import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';

abstract class SigninUserUseCase {
  Future<Either<FailureSignin, UserMesa>> call(Signin user);
}

class SigninUserUseCaseImpl implements SigninUserUseCase {
  final SigninRepository repository;

  SigninUserUseCaseImpl(this.repository);

  @override
  Future<Either<FailureSignin, UserMesa>> call(Signin user) async {
    if (user == null || user.email == null || user.password == null) {
      return Left(FailureSignin());
    }
    return repository.signin(user);
  }
}
