import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/modules/home/domain/entities/news_entity.dart';
import 'package:mesa_news_challenge/modules/home/presenter/controller/home_controller.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/utils/mesa_utils.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/card/card_last_news_widget.dart';
import 'package:share/share.dart';

class NewsPage extends StatefulWidget {
  final News news;
  final String title;
  NewsPage({Key key, this.news, this.title}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controller = Modular.get<HomeController>();
  News _news;
  @override
  void initState() {
    super.initState();
    _setNews();
  }

  void _setNews() {
    _news = widget.title == "Destaques"
        ? controller.newshighlights
            .firstWhere((element) => element.id == widget.news.id)
        : controller.news.firstWhere((element) => element.id == widget.news.id);
  }

  _onChanged() {
    widget.title == "Destaques"
        ? controller.setFavoriteHighlight(_news)
        : controller.setFavoriteNews(_news);
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => Share.share(widget.news.title,
                subject: widget.news.description),
          ),
        ),
      ),
      body: Observer(builder: (_) {
        _setNews();
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: MesaCardLastNewsWidget(
                  imagePath: widget.news.imageUrl,
                  title: widget.news.title,
                  isbookmark: _news.favorite,
                  onChanged: () => _onChanged(),
                  content: widget.news.content,
                  dateTime:
                      MesaUtils.dateFormatWithUpdate(widget.news.published),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
