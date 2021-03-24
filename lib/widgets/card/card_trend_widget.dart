import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';

class MesaCardTrendWidget extends StatefulWidget {
  final String imagePath, dateTime, title;
  MesaCardTrendWidget({Key key, this.imagePath, this.dateTime, this.title})
      : super(key: key);

  @override
  _MesaCardTrendWidgetState createState() => _MesaCardTrendWidgetState();
}

class _MesaCardTrendWidgetState extends State<MesaCardTrendWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 128,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Image.network(
              widget.imagePath,
              height: 128,
              width: 128,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 173,
                height: 88,
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.title,
                  style: MesaTextStyleGuide.subtitle02,
                  overflow: TextOverflow.clip,
                ),
              ),
              Row(
                children: [
                  MesaIconButtonWidget(),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      widget.dateTime,
                      style: MesaTextStyleGuide.heading05,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
