import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/home/domain/repositories/home_repository.dart';
import 'package:mesa_news_challenge/modules/home/domain/usecases/get_news_highlight_usecase.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';
import 'package:mesa_news_challenge/modules/signin/domain/usecases/signin_user_usecase.dart';
import 'package:mockito/mockito.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

main() {
  final repository = HomeRepositoryMock();
  final useCase = GetNewsHighlightUseCaseImpl(repository);

  group("Should Return a List news hightLight", () {
    test('- Success', () async {
      when(repository.getNewsHightlight()).thenAnswer(
        (_) async => Right(List<News>()),
      );
      final result = await useCase();
      expect(result, isA<Right>());
      expect(result | null, isA<List<News>>());
    });
  });
  group("Should Return a FailureGetNews", () {
    test('- Left', () async {
      when(repository.getNewsHightlight())
          .thenAnswer((_) async => Left(FailureGetNews()));
      final result = await useCase();
      expect(result, isA<Left>());
    });
  });
}
