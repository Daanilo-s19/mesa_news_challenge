import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';

class MesaAppBarDefaultWidget extends StatelessWidget {
  final String title, subtitle;
  final Widget prefix, sufix;
  final EdgeInsetsGeometry padding;
  const MesaAppBarDefaultWidget({
    Key key,
    this.title = "",
    this.prefix,
    this.sufix,
    this.padding,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 88,
        padding: padding ?? EdgeInsets.fromLTRB(16, 0, 16, 16),
        color: MesaColorsGuide.PRIMARY,
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefix != null
                ? SizedBox(child: prefix)
                : SizedBox(
                    width: 16,
                    height: 16,
                  ),
            // Column(
            //   children: [
            Container(
              child: Text(
                title,
                style: MesaTextStyleGuide.heading01
                    .copyWith(letterSpacing: -.41, color: Colors.white),
              ),
            ),
            //     subtitle != null
            //         ? Text(
            //             subtitle,
            //             style: MesaTextStyleGuide.heading04
            //                 .copyWith(color: Colors.white),
            //           )
            //         : SizedBox()
            //   ],
            // ),
            sufix != null
                ? SizedBox(child: sufix)
                : SizedBox(
                    width: 16,
                    height: 16,
                  ),
          ],
        ));
  }
}
