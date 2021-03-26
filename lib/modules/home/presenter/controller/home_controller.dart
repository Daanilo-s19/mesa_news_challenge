import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/modules/home/data/models/news_model.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/domain/usecases/get_news_highlight_usecase.dart';
import 'package:mesa_news_challenge/modules/home/domain/usecases/get_news_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

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
  bool loading;
  @observable
  bool isFavorite = false;
  @observable
  ObservableList<News> news = ObservableList<News>();
  @observable
  ObservableList<News> newshighlights = ObservableList<News>();
  @observable
  DateTime filterPerDate;
  @observable
  BuildContext context;
  @action
  getNews() async {
    loading = true;
    final result = await getNewsUseCase();
    result.fold(
      (error) => print(error.message),
      (success) {
        final orderingNews = setOrdering(success).toSet().toList();
        news = ObservableList.of(orderingNews);
      },
    );
    loading = false;
  }

  @action
  getNewsHighlight() async {
    loading = true;
    final result = await getNewsHighlightUseCase();
    result.fold(
      (error) => print(error.message),
      (success) {
        // final orderingHigh = setOrdering(success).toSet().toList();
        newshighlights = ObservableList.of(success.toSet().toList());
      },
    );
    loading = false;
  }

  @action
  setFavoriteNews(NewsModel item) {
    news.removeWhere((e) => e.id == item.id);
    final changed = item.copyWith(favorite: !item.favorite);
    news.add(changed);
    setOrdering(news);
  }

  @action
  setFavoriteHighlight(NewsModel item) {
    newshighlights.removeWhere((e) => e.id == item.id);
    final changed = item.copyWith(favorite: !item.favorite);
    newshighlights.add(changed);
    setOrdering(newshighlights);
  }

  @action
  bool getFilterNews({News value, DateTime dateTime, bool fav}) {
    if (fav && dateTime != null) {
      return DateFormat.yMMMd()
                  .format(dateTime)
                  .compareTo(DateFormat.yMMMd().format(value.published)) ==
              0 &&
          value.favorite;
    }
    if (dateTime != null) {
      return DateFormat.yMMMd()
              .format(dateTime)
              .compareTo(DateFormat.yMMMd().format(value.published)) ==
          0;
    } else {
      return fav ? value.favorite : true;
    }
  }

  @action
  showDateTimePicker() async => filterPerDate = await showDatePicker(
        context: context,
        initialDate: filterPerDate ?? DateTime.now(),
        firstDate: new DateTime(1960),
        lastDate: DateTime.now(),
      );

  @action
  cleanFilter() {
    filterPerDate = null;
    isFavorite = false;
  }

  List<News> setOrdering(List<News> order) {
    order.sort((a, b) {
      final comparePublished = b.published.compareTo(a.published);
      final compareTitle = a.title.compareTo(b.title);

      ///SE ambos forem favoritos, checo as datas para definir a ordem
      if (a.favorite == b.favorite) {
        ///SE ambos forem da mesma data, checo o titulo para definir a ordem
        if (comparePublished == 0) {
          return compareTitle;
        } else {
          return comparePublished;
        }
      } else {
        return a.favorite ? -1 : 1;
      }
    });
    return order;
  }

  @action
  toogleFavorite(bool value) => isFavorite = value;
}
