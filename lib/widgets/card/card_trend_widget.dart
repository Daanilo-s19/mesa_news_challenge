import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';

class MesaCardTrendWidget extends StatefulWidget {
  final String imagePath, dateTime, title;
  final Function() onChanged, onTap;
  MesaCardTrendWidget(
      {Key key,
      this.imagePath,
      this.dateTime,
      this.title,
      this.onChanged,
      this.onTap})
      : super(key: key);

  @override
  _MesaCardTrendWidgetState createState() => _MesaCardTrendWidgetState();
}

class _MesaCardTrendWidgetState extends State<MesaCardTrendWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 317,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Image.network(
                widget.imagePath,
                height: 127,
                width: 128,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 173,
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.title,
                    style: MesaTextStyleGuide.subtitle02,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Row(
                  children: [
                    MesaIconButtonWidget(
                      iconPath: "assets/bookmark.svg",
                      onTap: widget.onChanged,
                    ),
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
      ),
    );
  }
}
