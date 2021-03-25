import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signup/data/datasources/signup_datasources.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';
import 'package:mesa_news_challenge/modules/signup/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupDataSource dataSource;

  SignupRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureSignup, User>> signup(Signup user) async {
    try {
      final result = await dataSource.signup(user);
      return Right(result);
    } on FailureSignup catch (e) {
      return Left(FailureSignup(message: e.message));
    }
  }
}
