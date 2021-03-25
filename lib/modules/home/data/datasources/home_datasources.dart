import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';

abstract class HomeDataSource {
  Future<List<News>> getNews({
    int currentPage,
    int perPage,
    DateTime published,
  });
  Future<List<News>> getNewsHightlight();
}
