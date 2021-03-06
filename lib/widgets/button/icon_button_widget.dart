import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class MesaIconButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String iconPath;
  final Color iconColor;
  const MesaIconButtonWidget(
      {Key key, this.onTap, this.iconPath, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Modular.to.pop(),
      child: SvgPicture.asset(
        iconPath ?? "assets/close.svg",
        color: iconColor ?? null,
      ),
    );
  }
}
