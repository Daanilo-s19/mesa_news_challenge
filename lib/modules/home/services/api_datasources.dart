import 'package:dio/dio.dart';
import 'package:mesa_news_challenge/app/presenter/controller/app_controller.dart';
import 'package:mesa_news_challenge/modules/home/data/datasources/home_datasources.dart';
import 'package:mesa_news_challenge/modules/home/data/models/news_model.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/errors/errors.dart';

class ApiDataSource implements HomeDataSource {
  final AppController appController;

  ApiDataSource(this.appController);

  @override
  Future<List<News>> getNews(
      {int currentPage, int perPage, DateTime published}) async {
    try {
      final response = await appController.apiService.fetchNews(
        currentPage: currentPage,
        perPage: perPage,
        published: published,
      );
      List decode = response.data["data"];
      return decode
          .asMap()
          .entries
          .map((e) => NewsModel.fromMap(e.value, id: e.key))
          .toList();
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');
      throw FailureGetNews(message: ex.response.data["message"]);
    }
  }

  @override
  Future<List<News>> getNewsHightlight() async {
    try {
      final response = await appController.apiService.fetchNewsHighlights();
      List decode = response.data["data"];
      return decode
          .asMap()
          .entries
          .map((e) => NewsModel.fromMap(e.value, id: e.key))
          .toList();
    } on DioError catch (ex, s) {
      print('ex -> $ex, stack -> $s');
      throw FailureGetNews(message: ex.response.data["message"]);
    }
  }
}
