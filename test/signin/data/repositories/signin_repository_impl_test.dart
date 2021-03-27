import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/signin/data/datasources/signin_datasources.dart';
import 'package:mesa_news_challenge/modules/signin/data/repositories/signin_repository_impl.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mockito/mockito.dart';

class SigninDataSoureMock extends Mock implements SigninDataSource {}

void main() {
  final dataSource = SigninDataSoureMock();
  final repository = SigninRepositoryImpl(dataSource);

  group('Should return User ', () {
    test('- sign ', () async {
      when(dataSource.signin(any)).thenAnswer(
        (_) async => UserMesa(),
      );
      final result = await repository.signin(Signin(email: "", password: ""));
      expect(result, isA<Right>());
      expect(result | null, isA<UserMesa>());
    });
  });
  group('Should return FailureSignin ', () {
    test('- sign class params empty ', () async {
      when(dataSource.signin(any)).thenAnswer(
        (_) async => UserMesa(),
      );
      final result = await repository.signin(Signin());
      expect(result, isA<Left>());
    });
    test('- sign is null ', () async {
      when(dataSource.signin(any)).thenAnswer(
        (_) async => UserMesa(),
      );
      final result = await repository.signin(null);
      expect(result, isA<Left>());
    });
    test('- email is null ', () async {
      when(dataSource.signin(any)).thenAnswer(
        (_) async => UserMesa(),
      );
      final result = await repository.signin(Signin(password: ""));
      expect(result, isA<Left>());
    });
    test('- password is null ', () async {
      when(dataSource.signin(any)).thenAnswer(
        (_) async => UserMesa(),
      );
      final result = await repository.signin(Signin(email: ""));
      expect(result, isA<Left>());
    });
  });
}
