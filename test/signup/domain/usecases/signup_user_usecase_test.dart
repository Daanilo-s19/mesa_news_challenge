import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';
import 'package:mesa_news_challenge/modules/signin/domain/usecases/signin_user_usecase.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';
import 'package:mesa_news_challenge/modules/signup/domain/repositories/signup_repository.dart';
import 'package:mesa_news_challenge/modules/signup/domain/usecases/signup_user_usecase.dart';
import 'package:mockito/mockito.dart';

class SignupRepositoryMock extends Mock implements SignupRepository {}

main() {
  final repository = SignupRepositoryMock();
  final useCase = SignupUserUseCaseImpl(repository);

  group("Should Return a User", () {
    test('- Success', () async {
      when(repository.signup(any)).thenAnswer((_) async => Right(User()));
      final result = await useCase(Signup(email: "", password: "", name: ""));
      expect(result, isA<Right>());
      expect(result | null, isA<User>());
    });
  });
  group("Should Return a FailureSignin", () {
    test('- class params null', () async {
      when(repository.signup(any)).thenAnswer((_) async => Right(User()));
      final result = await useCase(Signup());
      expect(result, isA<Left>());
    });

    test('- SignIn is null', () async {
      when(repository.signup(any)).thenAnswer((_) async => Right(User()));
      final result = await useCase(null);
      expect(result, isA<Left>());
    });
    test('- email is null', () async {
      when(repository.signup(any)).thenAnswer((_) async => Right(User()));
      final result = await useCase(Signup(password: ""));
      expect(result, isA<Left>());
    });
    test('- passowrd is null', () async {
      when(repository.signup(any)).thenAnswer((_) async => Right(User()));
      final result = await useCase(Signup(email: ""));
      expect(result, isA<Left>());
    });
  });
}
