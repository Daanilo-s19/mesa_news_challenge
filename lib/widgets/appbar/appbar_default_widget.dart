import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      child: Row(
        children: [
          onTapLeft != null
              ? SvgPicture.asset("assets/close.svg")
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
              ? SvgPicture.asset("assets/close.svg")
              : SizedBox(
                  width: 16,
                  height: 16,
                ),
        ],
      ),
    );
  }
}
