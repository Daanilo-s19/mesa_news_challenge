import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/enum/mesa_button_type.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';

class MesaButtonDefaultWidget extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final BorderSide border;
  final Function onPressed;
  final MesaButtonType type;

  const MesaButtonDefaultWidget(
      {Key key,
      this.text = "",
      this.textStyle,
      this.backgroundColor = MesaColorsGuide.PRIMARY,
      this.border,
      this.onPressed,
      this.type = MesaButtonType.PRIMARY})
      : super(key: key);
  @override
  _MesaButtonDefaultWidgetState createState() =>
      _MesaButtonDefaultWidgetState();
}

class _MesaButtonDefaultWidgetState extends State<MesaButtonDefaultWidget> {
  Widget getButtonType(MesaButtonType type) {
    switch (type) {
      case MesaButtonType.PRIMARY:
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
            elevation: 0,
            child: Text(
              widget.text,
              style: widget.textStyle ?? MesaTextStyleGuide.button,
            ),
            onPressed: widget.onPressed ?? () {},
          ),
        );
      case MesaButtonType.DISABLED:
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: RaisedButton(
            splashColor: widget.backgroundColor.withOpacity(.4),
            color: MesaColorsGuide.GRAY04,
            shape: RoundedRectangleBorder(
              side: widget.border ?? BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            elevation: 0,
            child: Text(
              widget.text,
              style: MesaTextStyleGuide.button
                  .copyWith(color: MesaColorsGuide.GRAY05),
            ),
            onPressed: widget.onPressed ?? () {},
          ),
        );
      case MesaButtonType.LOADING:
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: RaisedButton(
            splashColor: widget.backgroundColor.withOpacity(.4),
            color: MesaColorsGuide.LINK,
            shape: RoundedRectangleBorder(
              side: widget.border ?? BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Text(
                  "Carregando",
                  style: widget.textStyle ?? MesaTextStyleGuide.button,
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        );

      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return getButtonType(widget.type);
  }
}
