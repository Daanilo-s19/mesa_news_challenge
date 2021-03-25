import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/home/data/datasources/home_datasources.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureGetNews, List<News>>> getNews({
    int currentPage,
    int perPage,
    DateTime published,
  }) async {
    try {
      final result = await dataSource.getNews(
        currentPage: currentPage,
        perPage: perPage,
        published: published,
      );
      return Right(result);
    } on FailureGetNews catch (e) {
      return Left(FailureGetNews(message: e.message));
    }
  }

  @override
  Future<Either<FailureGetNews, List<News>>> getNewsHightlight() async {
    try {
      final result = await dataSource.getNewsHightlight();
      return Right(result);
    } on FailureGetNews catch (e) {
      return Left(FailureGetNews(message: e.message));
    }
  }
}
