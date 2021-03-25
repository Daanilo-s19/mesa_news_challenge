import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/presenter/home_controller.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';
import 'package:mesa_news_challenge/widgets/card/card_last_news_widget.dart';
import 'package:mesa_news_challenge/widgets/card/card_trend_widget.dart';

class HomePage extends StatefulWidget {
  final String title, datetime;

  HomePage({Key key, this.title, this.datetime}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  List<Widget> _renderNewsHighlight({List<News> newsHighlight}) {
    return newsHighlight
        .map(
          (item) => item.highlight
              ? Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: MesaCardTrendWidget(
                        imagePath: item.imageUrl,
                        title: item.title,
                        dateTime: "2 horas atrás",
                      ),
                    ),
                    Divider(color: MesaColorsGuide.GRAY03, height: 1),
                  ],
                )
              : SizedBox(),
        )
        .toList();
  }

  List<Widget> _renderNews({List<News> news}) {
    return news
        .map((item) => Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: MesaCardLastNewsWidget(
                    imagePath: item.imageUrl,
                    title: item.title,
                    description: item.description,
                    dateTime: "2 horas atrás",
                  ),
                ),
                Divider(color: MesaColorsGuide.GRAY03, height: 1),
              ],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            MesaAppBarDefaultWidget(
              sufix: MesaIconButtonWidget(
                onTap: () {},
                iconPath: "assets/filter.svg",
              ),
              title: "Mesa News",
            ),
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
              child: Text("Últimas notícias",
                  style: MesaTextStyleGuide.subtitle01),
            ),
            ..._renderNews(news: controller.news),
          ],
        ),
      ),
    );
  }
}
