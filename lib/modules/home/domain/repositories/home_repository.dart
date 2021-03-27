import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/errors/errors.dart';

abstract class HomeRepository {
  Future<Either<FailureGetNews, List<News>>> getNews({
    int currentPage,
    int perPage,
    DateTime published,
  });
  Future<Either<FailureGetNews, List<News>>> getNewsHightlight();
}
