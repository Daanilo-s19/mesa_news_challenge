import 'package:flutter/material.dart';

import 'colors_guide_theme.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: MesaColorsGuide.PRIMARY,
  accentColor: MesaColorsGuide.PRIMARY,
  backgroundColor: Colors.white,
  cursorColor: MesaColorsGuide.PRIMARY,
  canvasColor: Colors.transparent,
  brightness: Brightness.light,
  splashColor: MesaColorsGuide.PRIMARY,
  fontFamily: "Roboto",
  visualDensity: VisualDensity.adaptivePlatformDensity,
  sliderTheme: SliderThemeData(
    overlayColor: MesaColorsGuide.PRIMARY.withOpacity(0.1),
    activeTrackColor: MesaColorsGuide.PRIMARY,
    inactiveTrackColor: MesaColorsGuide.GRAY01,
    thumbColor: MesaColorsGuide.PRIMARY,
    activeTickMarkColor: MesaColorsGuide.PRIMARY,
    inactiveTickMarkColor: MesaColorsGuide.GRAY01,
  ),
);
