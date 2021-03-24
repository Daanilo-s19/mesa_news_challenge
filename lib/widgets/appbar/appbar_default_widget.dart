import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';

class MesaAppBarDefaultWidget extends StatelessWidget {
  final String title;
  final Function() onTapLeft, onTapRight;
  const MesaAppBarDefaultWidget({
    Key key,
    this.title = "",
    this.onTapRight,
    this.onTapLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      color: MesaColorsGuide.PRIMARY,
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          onTapLeft != null
              ? InkWell(
                  onTap: onTapLeft, child: SvgPicture.asset("assets/close.svg"))
              : SizedBox(
                  width: 16,
                  height: 16,
                ),
          Text(
            title,
            style: MesaTextStyleGuide.heading01
                .copyWith(letterSpacing: -.41, color: Colors.white),
          ),
          onTapRight != null
              ? InkWell(
                  onTap: onTapRight,
                  child: SvgPicture.asset("assets/close.svg"))
              : SizedBox(
                  width: 16,
                  height: 16,
                ),
        ],
      ),
    );
  }
}
