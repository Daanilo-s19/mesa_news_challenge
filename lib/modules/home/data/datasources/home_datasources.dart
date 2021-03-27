import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';

abstract class HomeDataSource {
  Future<List<News>> getNews({
    int currentPage,
    int perPage,
    DateTime published,
  });
  Future<List<News>> getNewsHightlight();
}
