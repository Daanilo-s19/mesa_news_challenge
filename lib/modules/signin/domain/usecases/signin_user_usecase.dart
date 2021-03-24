import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';

abstract class SigninUserUseCase {
  Future<Either<FailureSignin, Signin>> call(Signin user);
}

class SigninUserUseCaseImpl implements SigninUserUseCase {
  final SigninRepository repository;

  SigninUserUseCaseImpl(this.repository);

  @override
  Future<Either<FailureSignin, Signin>> call(Signin user) async {
    return repository.signin(user);
  }
}
