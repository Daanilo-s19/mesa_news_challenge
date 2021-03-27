import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/app/presenter/controller/user_controller.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/presenter/news_page.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/utils/mesa_utils.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';
import 'package:mesa_news_challenge/widgets/card/card_last_news_widget.dart';
import 'package:mesa_news_challenge/widgets/card/card_trend_widget.dart';

import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title, datetime;

  HomePage({Key key, this.title, this.datetime}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final userController = Modular.get<UserController>();
  void _redirectToNewPage({News item, String title = ""}) => Modular.to.push(
        MaterialPageRoute(
          builder: (context) => NewsPage(
            news: item,
            title: title,
          ),
        ),
      );
  List<Widget> _renderNewsHighlight({List<News> newsHighlight}) {
    final emptyFilter = !newsHighlight.any(
      (item) => controller.getFilterNews(
          value: item,
          dateTime: controller.filterPerDate,
          fav: controller.isFavorite),
    );

    if (newsHighlight.isEmpty) {
      return [
        Center(child: Text("Parece que não temos notícias em destaque :(")),
      ];
    }
    if (emptyFilter) {
      return [
        Center(child: Text("Não há resultado para este filtro :(")),
      ];
    }
    return newsHighlight.map((item) {
      final isShow = controller.getFilterNews(
              value: item,
              dateTime: controller.filterPerDate,
              fav: controller.isFavorite) &&
          item.highlight;

      return isShow
          ? Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: MesaCardTrendWidget(
                    imagePath: item.imageUrl,
                    title: item.title,
                    dateTime: MesaUtils.dateTimeDifference(item.published),
                    isbookmark: item.favorite,
                    isShow: controller.isFavorite ? item.favorite : true,
                    onChanged: () => controller.setFavoriteHighlight(item),
                    onTap: () =>
                        _redirectToNewPage(item: item, title: "Destaques"),
                  ),
                ),
                Divider(color: MesaColorsGuide.GRAY03, height: 1),
              ],
            )
          : SizedBox();
    }).toList();
  }

  List<Widget> _renderNews({List<News> news}) {
    final emptyFilter = !news.any(
      (item) => controller.getFilterNews(
        value: item,
        dateTime: controller.filterPerDate,
        fav: controller.isFavorite,
      ),
    );
    if (news.isEmpty) {
      return [
        Center(
            child: Text(
                "Parece que ainda não temos nenhuma notícias para exibir :(")),
      ];
    }

    if (emptyFilter) {
      return [
        Center(child: Text("Não há resultado para este filtro :(")),
      ];
    }

    return controller.news.map((item) {
      final isShow = controller.getFilterNews(
        value: item,
        dateTime: controller.filterPerDate,
        fav: controller.isFavorite,
      );

      return isShow
          ? Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: MesaCardLastNewsWidget(
                    imagePath: item.imageUrl,
                    title: item.title,
                    description: item.description,
                    onTap: () => _redirectToNewPage(
                        item: item, title: "Últimas notícias"),
                    isbookmark: item.favorite,
                    onChanged: () => controller.setFavoriteNews(item),
                    dateTime: MesaUtils.dateTimeDifference(item.published),
                  ),
                ),
                Divider(color: MesaColorsGuide.GRAY03, height: 1),
              ],
            )
          : SizedBox();
    }).toList();
  }

  Widget _render() {
    if (controller.loading) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
        ),
      );
    } else {
      return ListView(
        padding: EdgeInsets.all(0),
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 16, left: 16),
            child: Text("Destaques", style: MesaTextStyleGuide.subtitle01),
          ),
          Container(
            height: 128,
            child: ListView(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              children: _renderNewsHighlight(
                  newsHighlight: controller.newshighlights),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 2, left: 16),
            child:
                Text("Últimas notícias", style: MesaTextStyleGuide.subtitle01),
          ),
          ..._renderNews(news: controller.news),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MesaColorsGuide.GRAY06,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: MesaAppBarDefaultWidget(
          title: "Mesa News",
          prefix: IconButton(
              color: MesaColorsGuide.GRAY01,
              icon: Icon(
                Icons.power_settings_new,
                color: MesaColorsGuide.GRAY01,
              ),
              onPressed: () => userController.logOutUser()),
          sufix: IconButton(
            icon: SvgPicture.asset("assets/filter.svg"),
            tooltip: 'Filter',
            onPressed: () => Modular.to.pushNamed("/home/filter"),
          ),
        ),
      ),
      body: Observer(builder: (_) => _render()),
    );
  }
}
