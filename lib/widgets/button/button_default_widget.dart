import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';

class MesaButtonDefaultWidget extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final BorderSide border;
  final Function onPressed;

  const MesaButtonDefaultWidget(
      {Key key,
      this.text = "",
      this.textStyle,
      this.backgroundColor = MesaColorsGuide.PRIMARY,
      this.border,
      this.onPressed})
      : super(key: key);
  @override
  _MesaButtonDefaultWidgetState createState() =>
      _MesaButtonDefaultWidgetState();
}

class _MesaButtonDefaultWidgetState extends State<MesaButtonDefaultWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: RaisedButton(
        splashColor: widget.backgroundColor.withOpacity(.4),
        color: widget.backgroundColor ?? MesaColorsGuide.PRIMARY,
        shape: RoundedRectangleBorder(
          side: widget.border ?? BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          widget.text,
          style: widget.textStyle ?? MesaTextStyleGuide.button,
        ),
        onPressed: widget.onPressed ?? () {},
      ),
    );
  }
}
