import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';

class MesaAppBarDefaultWidget extends StatefulWidget {
  final String title, subtitle;
  final TextStyle textStyle;

  final Widget prefix, sufix;

  const MesaAppBarDefaultWidget(
      {Key key,
      this.title = "",
      this.subtitle,
      this.prefix,
      this.sufix,
      this.textStyle})
      : super(key: key);
  @override
  _MesaAppBarDefaultWidgetState createState() =>
      _MesaAppBarDefaultWidgetState();
}

class _MesaAppBarDefaultWidgetState extends State<MesaAppBarDefaultWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: widget.textStyle ??
                MesaTextStyleGuide.heading01
                    .copyWith(letterSpacing: -.41, color: Colors.white),
          ),
          widget.subtitle != null
              ? Container(
                  margin: EdgeInsets.only(top: 4),
                  width: 77,
                  child: Text(
                    widget.subtitle,
                    overflow: TextOverflow.clip,
                    style: MesaTextStyleGuide.heading04
                        .copyWith(color: Colors.white),
                  ),
                )
              : SizedBox()
        ],
      ),
      centerTitle: true,
      leading: Container(
        child: widget.prefix ??
            IconButton(
              icon: SvgPicture.asset(
                "assets/close.svg",
              ),
              onPressed: () => Modular.to.pop(),
            ),
      ),
      // leadingWidth: 16,
      toolbarHeight: 44,
      elevation: 0,
      actions: <Widget>[
        widget.sufix != null ? widget.sufix : SizedBox(width: 16)
      ],
    );
  }
}
