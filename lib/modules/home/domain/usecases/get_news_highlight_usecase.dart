import 'package:dartz/dartz.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/home/domain/repositories/home_repository.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/errors/errors.dart';
import 'package:mesa_news_challenge/modules/signin/domain/repositories/signin_repository.dart';

abstract class GetNewsHighlightUseCase {
  Future<Either<FailureGetNews, List<News>>> call();
}

class GetNewsHighlightUseCaseImpl implements GetNewsHighlightUseCase {
  final HomeRepository repository;

  GetNewsHighlightUseCaseImpl(this.repository);

  @override
  Future<Either<FailureGetNews, List<News>>> call() async {
    return repository.getNewsHightlight();
  }
}
