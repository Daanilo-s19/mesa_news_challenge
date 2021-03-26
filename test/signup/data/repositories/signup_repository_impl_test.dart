import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/data/repositories/signin_repository_impl.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signup/data/datasources/signup_datasources.dart';
import 'package:mesa_news_challenge/modules/signup/data/repositories/signup_repository_impl.dart';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';
import 'package:mockito/mockito.dart';

class SignupDataSoureMock extends Mock implements SignupDataSource {}

void main() {
  final dataSource = SignupDataSoureMock();
  final repository = SignupRepositoryImpl(dataSource);

  group('Should return User ', () {
    test('- sign ', () async {
      when(dataSource.signup(any)).thenAnswer(
        (_) async => User(),
      );
      final result =
          await repository.signup(Signup(email: "", password: "", name: ""));
      expect(result, isA<Right>());
      expect(result | null, isA<User>());
    });
  });
  group('Should return FailureSignup ', () {
    test('- signup class params empty ', () async {
      when(dataSource.signup(any)).thenAnswer(
        (_) async => User(),
      );
      final result = await repository.signup(Signup());
      expect(result, isA<Left>());
    });
    test('- signup is null ', () async {
      when(dataSource.signup(any)).thenAnswer(
        (_) async => User(),
      );
      final result = await repository.signup(null);
      expect(result, isA<Left>());
    });
    test('- email is null ', () async {
      when(dataSource.signup(any)).thenAnswer(
        (_) async => User(),
      );
      final result = await repository.signup(Signup(password: ""));
      expect(result, isA<Left>());
    });
    test('- password is null ', () async {
      when(dataSource.signup(any)).thenAnswer(
        (_) async => User(),
      );
      final result = await repository.signup(Signup(email: ""));
      expect(result, isA<Left>());
    });
    test('- name is null ', () async {
      when(dataSource.signup(any)).thenAnswer(
        (_) async => User(),
      );
      final result = await repository.signup(Signup(name: ""));
      expect(result, isA<Left>());
    });
  });
}
