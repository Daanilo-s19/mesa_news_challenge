import 'package:flutter/material.dart';

class MesaAnimationSizeWidget extends StatefulWidget {
  final Widget child;
  final double width, height;
  final Duration duration;
  MesaAnimationSizeWidget(
      {Key key, this.child, this.width, this.height, this.duration})
      : super(key: key);

  @override
  _MesaAnimationSizeWidgetState createState() =>
      _MesaAnimationSizeWidgetState();
}

class _MesaAnimationSizeWidgetState extends State<MesaAnimationSizeWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration ?? Duration(milliseconds: 150),
      vsync: this,
      child: Container(
          width: widget.width, height: widget.height, child: widget.child),
    );
  }
}
