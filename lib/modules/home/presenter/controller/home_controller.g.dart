// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_HomeControllerBase.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$newsAtom = Atom(name: '_HomeControllerBase.news');

  @override
  ObservableList<News> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(ObservableList<News> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$newshighlightsAtom = Atom(name: '_HomeControllerBase.newshighlights');

  @override
  ObservableList<News> get newshighlights {
    _$newshighlightsAtom.reportRead();
    return super.newshighlights;
  }

  @override
  set newshighlights(ObservableList<News> value) {
    _$newshighlightsAtom.reportWrite(value, super.newshighlights, () {
      super.newshighlights = value;
    });
  }

  final _$filterPerDateAtom = Atom(name: '_HomeControllerBase.filterPerDate');

  @override
  DateTime get filterPerDate {
    _$filterPerDateAtom.reportRead();
    return super.filterPerDate;
  }

  @override
  set filterPerDate(DateTime value) {
    _$filterPerDateAtom.reportWrite(value, super.filterPerDate, () {
      super.filterPerDate = value;
    });
  }

  final _$contextAtom = Atom(name: '_HomeControllerBase.context');

  @override
  BuildContext get context {
    _$contextAtom.reportRead();
    return super.context;
  }

  @override
  set context(BuildContext value) {
    _$contextAtom.reportWrite(value, super.context, () {
      super.context = value;
    });
  }

  final _$getNewsAsyncAction = AsyncAction('_HomeControllerBase.getNews');

  @override
  Future getNews() {
    return _$getNewsAsyncAction.run(() => super.getNews());
  }

  final _$getNewsHighlightAsyncAction =
      AsyncAction('_HomeControllerBase.getNewsHighlight');

  @override
  Future getNewsHighlight() {
    return _$getNewsHighlightAsyncAction.run(() => super.getNewsHighlight());
  }

  final _$showDateTimePickerAsyncAction =
      AsyncAction('_HomeControllerBase.showDateTimePicker');

  @override
  Future showDateTimePicker() {
    return _$showDateTimePickerAsyncAction
        .run(() => super.showDateTimePicker());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setFavoriteNews(NewsModel item) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFavoriteNews');
    try {
      return super.setFavoriteNews(item);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFavoriteHighlight(NewsModel item) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFavoriteHighlight');
    try {
      return super.setFavoriteHighlight(item);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool getFilterNews({News value, DateTime dateTime, bool fav}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getFilterNews');
    try {
      return super.getFilterNews(value: value, dateTime: dateTime, fav: fav);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cleanFilter() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.cleanFilter');
    try {
      return super.cleanFilter();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toogleFavorite(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.toogleFavorite');
    try {
      return super.toogleFavorite(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isFavorite: ${isFavorite},
news: ${news},
newshighlights: ${newshighlights},
filterPerDate: ${filterPerDate},
context: ${context}
    ''';
  }
}
