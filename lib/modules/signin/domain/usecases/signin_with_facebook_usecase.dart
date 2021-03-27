import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';

abstract class SigninWithFacebookUsecase {
  Future<Either<FailureSignin, UserMesa>> call();
}

class SigninWithFacebookUsecaseImpl implements SigninWithFacebookUsecase {
  final SigninRepository repository;

  SigninWithFacebookUsecaseImpl(this.repository);
  Future<Either<FailureSignin, UserMesa>> call() {
    return repository.signinWithFacebook();
  }
}
