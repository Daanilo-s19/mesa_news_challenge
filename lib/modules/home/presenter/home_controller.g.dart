// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$newsAtom = Atom(name: '_HomeControllerBase.news');

  @override
  List<News> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(List<News> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$newshighlightsAtom = Atom(name: '_HomeControllerBase.newshighlights');

  @override
  List<News> get newshighlights {
    _$newshighlightsAtom.reportRead();
    return super.newshighlights;
  }

  @override
  set newshighlights(List<News> value) {
    _$newshighlightsAtom.reportWrite(value, super.newshighlights, () {
      super.newshighlights = value;
    });
  }

  final _$getNewsAsyncAction = AsyncAction('_HomeControllerBase.getNews');

  @override
  Future getNews() {
    return _$getNewsAsyncAction.run(() => super.getNews());
  }

  @override
  String toString() {
    return '''
news: ${news},
newshighlights: ${newshighlights}
    ''';
  }
}
