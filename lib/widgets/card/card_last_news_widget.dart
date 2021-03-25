import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';

class MesaCardLastNewsWidget extends StatefulWidget {
  final String imagePath, title, description, dateTime;
  MesaCardLastNewsWidget(
      {Key key,
      this.imagePath = "",
      this.title = "",
      this.description = "",
      this.dateTime = ""})
      : super(key: key);

  @override
  _MesaCardLastNewsWidgetState createState() => _MesaCardLastNewsWidgetState();
}

class _MesaCardLastNewsWidgetState extends State<MesaCardLastNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.imagePath,
            height: 128,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MesaIconButtonWidget(),
              Text(
                widget.dateTime,
                style: MesaTextStyleGuide.heading05,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.title,
              style: MesaTextStyleGuide.subtitle02
                  .copyWith(fontWeight: FontWeight.w700),
              overflow: TextOverflow.clip,
            ),
          ),
          Container(
            height: 54,
            child: Text(
              widget.description,
              maxLines: 2,
              style: MesaTextStyleGuide.heading05
                  .copyWith(fontStyle: FontStyle.normal),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
