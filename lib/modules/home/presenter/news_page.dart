import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/card/card_last_news_widget.dart';

class NewsPage extends StatefulWidget {
  final News news;
  final String title;
  NewsPage({Key key, this.news, this.title}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.news);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: MesaAppBarDefaultWidget(
            title: widget.title,
            subtitle: widget.news.url,
            textStyle: MesaTextStyleGuide.heading05.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
            sufix: IconButton(
              icon: SvgPicture.asset("assets/more.svg"),
              tooltip: 'more',
              onPressed: () {},
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: MesaCardLastNewsWidget(
                  imagePath: widget.news.imageUrl,
                  title: widget.news.title,
                  content: widget.news.content,
                  dateTime: "2 horas atrás",
                ),
              ),
            ],
          ),
        ));
  }
}
