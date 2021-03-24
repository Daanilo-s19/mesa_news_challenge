import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';

class MesaFooterDefaultWidget extends StatelessWidget {
  final String text, textLink;
  final TextStyle textStyle, textLinkStyle;
  final Function() onTap;
  const MesaFooterDefaultWidget(
      {Key key,
      this.text = "",
      this.textLink = "",
      this.onTap,
      this.textStyle,
      this.textLinkStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textStyle ??
              MesaTextStyleGuide.heading02.copyWith(color: Colors.white),
        ),
        InkWell(
          onTap: onTap ?? () {},
          child: Text(
            textLink,
            style: textLinkStyle ??
                MesaTextStyleGuide.heading02
                    .copyWith(color: MesaColorsGuide.LINK),
          ),
        ),
      ],
    );
  }
}
