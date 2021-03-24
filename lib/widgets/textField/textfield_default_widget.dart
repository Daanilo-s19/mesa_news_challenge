import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';

class MesaTextFieldDefaultWidget extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;
  final bool autofocus, obscureText;
  final Function(String) onChanged;

  MesaTextFieldDefaultWidget(
      {Key key,
      this.keyboardType = TextInputType.text,
      this.autofocus = false,
      this.onChanged,
      this.label = "",
      this.obscureText = false})
      : super(key: key);

  @override
  _MesaTextFieldDefaultWidgetState createState() =>
      _MesaTextFieldDefaultWidgetState();
}

class _MesaTextFieldDefaultWidgetState
    extends State<MesaTextFieldDefaultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: MesaTextStyleGuide.heading03,
        ),
        Container(
          height: 48,
          margin: EdgeInsets.only(top: 8),
          child: TextField(
            keyboardType: widget.keyboardType,
            autofocus: widget.autofocus,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: MesaColorsGuide.GRAY01,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: widget.onChanged,
            style: MesaTextStyleGuide.heading03,
          ),
        ),
      ],
    );
  }
}
