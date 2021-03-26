import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/home/data/datasources/home_datasources.dart';
import 'package:mesa_news_challenge/modules/home/data/repositories/home_repository_impl.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signin/data/datasources/signin_datasources.dart';
import 'package:mesa_news_challenge/modules/signin/data/repositories/signin_repository_impl.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mockito/mockito.dart';

class SigninDataSoureMock extends Mock implements HomeDataSource {}

void main() {
  final dataSource = SigninDataSoureMock();
  final repository = HomeRepositoryImpl(dataSource);

  group('Should return User ', () {
    test('- getNews', () async {
      when(dataSource.getNews()).thenAnswer(
        (_) async => List<News>(),
      );
      final result = await repository.getNews();
      expect(result, isA<Right>());
      expect(result | null, isA<List<News>>());
    });

    test('- getNews with params', () async {
      when(dataSource.getNews(
              currentPage: anyNamed("currentPage"),
              perPage: anyNamed("perPage"),
              published: anyNamed("published")))
          .thenAnswer(
        (_) async => List<News>(),
      );
      final result = await repository.getNews(
        currentPage: 1,
        perPage: 1,
        published: DateTime.now(),
      );
      expect(result, isA<Right>());
      expect(result | null, isA<List<News>>());
    });
    test('- getNewsHightlight ', () async {
      when(dataSource.getNewsHightlight()).thenAnswer(
        (_) async => List<News>(),
      );
      final result = await repository.getNewsHightlight();
      expect(result, isA<Right>());
      expect(result | null, isA<List<News>>());
    });
  });
}
