import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/home/domain/repositories/home_repository.dart';

abstract class GetNewsUseCase {
  Future<Either<FailureGetNews, List<News>>> call({
    int currentPage,
    int perPage,
    DateTime published,
  });
}

class GetNewsUseCaseImpl implements GetNewsUseCase {
  final HomeRepository repository;

  GetNewsUseCaseImpl(this.repository);

  @override
  Future<Either<FailureGetNews, List<News>>> call({
    int currentPage,
    int perPage,
    DateTime published,
  }) async {
    return repository.getNews(
      currentPage: currentPage,
      perPage: perPage,
      published: published,
    );
  }
}
