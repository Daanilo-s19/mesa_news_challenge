import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/button/icon_button_widget.dart';

class MesaCardLastNewsWidget extends StatefulWidget {
  final String imagePath, title, description, dateTime, content;
  final Function() onTap;
  final Function() onChanged;
  final bool isbookmark;
  MesaCardLastNewsWidget({
    Key key,
    this.imagePath = "",
    this.title = "",
    this.description,
    this.dateTime = "",
    this.onChanged,
    this.onTap,
    this.content,
    this.isbookmark = false,
  }) : super(key: key);

  @override
  _MesaCardLastNewsWidgetState createState() => _MesaCardLastNewsWidgetState();
}

class _MesaCardLastNewsWidgetState extends State<MesaCardLastNewsWidget> {
  bool isBookmark;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBookmark = widget.isbookmark;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FadeInImage.assetNetwork(image: widget.imagePath,placeholder: , )
            Image.network(
              widget.imagePath,
              height: 128,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  Text('Some errors occurred!'),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MesaIconButtonWidget(
                    iconPath: "assets/bookmark.svg",
                    iconColor:
                        widget.isbookmark ? MesaColorsGuide.PRIMARY : null,
                    onTap: widget.onChanged ?? () {},
                  ),
                  Text(
                    widget.dateTime,
                    style: MesaTextStyleGuide.heading05,
                  ),
                ],
              ),
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
            widget.description != null
                ? Container(
                    height: 54,
                    child: Text(
                      widget.description,
                      maxLines: 2,
                      style: MesaTextStyleGuide.heading05
                          .copyWith(fontStyle: FontStyle.normal),
                      overflow: TextOverflow.clip,
                    ),
                  )
                : SizedBox(),
            widget.content != null
                ? Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      widget.content,
                      style: MesaTextStyleGuide.heading05
                          .copyWith(fontStyle: FontStyle.normal),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
