import 'package:flutter/material.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';

class MesaSwitchButtonWidget extends StatefulWidget {
  final Function(bool) onChanged;
  final bool value;
  MesaSwitchButtonWidget({Key key, this.onChanged, this.value})
      : super(key: key);

  @override
  _MesaSwitchButtonWidgetState createState() => _MesaSwitchButtonWidgetState();
}

class _MesaSwitchButtonWidgetState extends State<MesaSwitchButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      //TODO: definir curvas da animações
      child: AnimatedContainer(
        width: 51,
        height: 31,
        padding: EdgeInsets.all(1),
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: widget.value ? MesaColorsGuide.SUCCESS : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.5,
            color: MesaColorsGuide.GRAY06,
          ),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 250),
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                width: .5,
                color: MesaColorsGuide.GRAY06,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
