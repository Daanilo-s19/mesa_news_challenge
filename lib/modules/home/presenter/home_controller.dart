import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/usecases/get_news_highlight_usecase.dart';
import 'package:mesa_news_challenge/modules/home/domain/usecases/get_news_usecase.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetNewsUseCase getNewsUseCase;
  final GetNewsHighlightUseCase getNewsHighlightUseCase;
  _HomeControllerBase(this.getNewsUseCase, this.getNewsHighlightUseCase) {
    getNews();
    getNewsHighlight();
  }

  @observable
  List<News> news = [];
  @observable
  List<News> newshighlights = [];

  @action
  getNews() async {
    final result = await getNewsUseCase();
    result.fold(
      (error) => print(error.message),
      (success) => news = success.toSet().toList(),
    );
  }

  @action
  getNewsHighlight() async {
    final result = await getNewsHighlightUseCase();
    result.fold(
      (error) => print(error.message),
      (success) => newshighlights = success.toSet().toList(),
    );
  }
}
