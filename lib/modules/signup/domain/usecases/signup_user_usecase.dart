import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';
import 'package:mesa_news_challenge/modules/signup/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signup/domain/repositories/signup_repository.dart';

abstract class SignupUserUseCase {
  Future<Either<FailureSignup, Signup>> call(Signup user);
}

class SignupUserUseCaseImpl implements SignupUserUseCase {
  final SignupRepository repository;

  SignupUserUseCaseImpl(this.repository);

  @override
  Future<Either<FailureSignup, Signup>> call(Signup user) async {
    return repository.signup(user);
  }
}
