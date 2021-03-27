import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';
import 'package:mesa_news_challenge/modules/signin/domain/usecases/signin_user_usecase.dart';
import 'package:mockito/mockito.dart';

class SigninRepositoryMock extends Mock implements SigninRepository {}

main() {
  final repository = SigninRepositoryMock();
  final useCase = SigninUserUseCaseImpl(repository);

  group("Should Return a User", () {
    test('- Success', () async {
      when(repository.signin(any)).thenAnswer((_) async => Right(UserMesa()));
      final result = await useCase(Signin(email: "", password: ""));
      expect(result, isA<Right>());
      expect(result | null, isA<UserMesa>());
    });
  });
  group("Should Return a FailureSignin", () {
    test('- class params null', () async {
      when(repository.signin(any)).thenAnswer((_) async => Right(UserMesa()));
      final result = await useCase(Signin());
      expect(result, isA<Left>());
    });

    test('- SignIn is null', () async {
      when(repository.signin(any)).thenAnswer((_) async => Right(UserMesa()));
      final result = await useCase(null);
      expect(result, isA<Left>());
    });
    test('- email is null', () async {
      when(repository.signin(any)).thenAnswer((_) async => Right(UserMesa()));
      final result = await useCase(Signin(password: ""));
      expect(result, isA<Left>());
    });
    test('- passowrd is null', () async {
      when(repository.signin(any)).thenAnswer((_) async => Right(UserMesa()));
      final result = await useCase(Signin(email: ""));
      expect(result, isA<Left>());
    });
  });
}
