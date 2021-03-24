import 'package:flutter/material.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            margin: EdgeInsets.only(left: 16),
            height: 128,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: MesaCardTrendWidget(
                    imagePath:
                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.minhaseriefavorita.com%2Fwp-content%2Fuploads%2F2018%2F06%2Fnovo-filme-da-mulher-maravilha-tem-titulo-oficial-e-primeiras-imagens-divulgadas-1-850x510.jpg&f=1&nofb=1",
                    title:
                        "'Mulher-Maravilha 1984' é adiado para agosto de 2020 por conta da covid-19.",
                    dateTime: "16 horas atrás",
                  ),
                ),
                MesaCardTrendWidget(),
                MesaCardTrendWidget(),
                MesaCardTrendWidget(),
                MesaCardTrendWidget(),
                MesaCardTrendWidget(),
                MesaCardTrendWidget(),
                MesaCardTrendWidget(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 2, left: 16),
            child:
                Text("Últimas notícias", style: MesaTextStyleGuide.subtitle01),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: MesaCardLastNewsWidget(
              imagePath:
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.minhaseriefavorita.com%2Fwp-content%2Fuploads%2F2018%2F06%2Fnovo-filme-da-mulher-maravilha-tem-titulo-oficial-e-primeiras-imagens-divulgadas-1-850x510.jpg&f=1&nofb=1",
              title:
                  "Bolsa dispara 9%; dólar opera em baixa, vendido perto de R5,08",
              description:
                  "No mesmo horário, o dólar registrava baixa de 1,02%, a R 5,084 na venda, após fechar em alta de 2,21%, a R 5,138 na venda, ontem.",
              dateTime: "2 horas atrás",
            ),
          ),
          Divider(color: MesaColorsGuide.GRAY03, height: 1),
          // Container(
          //   margin: EdgeInsets.all(16),
          //   child: MesaCardLastNewsWidget(),
          // ),
        ],
      ),
    );
  }
}
