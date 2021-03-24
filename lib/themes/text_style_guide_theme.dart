import 'package:flutter/material.dart';

import 'colors_guide_theme.dart';

class MesaTextStyleGuide {
  ///font-weight: w900;
  ///font-size: 19px;
  /// letter spacing: 25px;
  ///color: #GRAY01;
  static final title01 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w900,
    color: MesaColorsGuide.GRAY01,
    letterSpacing: 25,
    fontFamily: "Roboto",
  );

  ///font-weight: w700;
  ///font-size: 18px;
  /// letter spacing: -.41;
  ///color: #black;
  static final subtitle01 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    letterSpacing: -.41,
    fontFamily: "Roboto",
  );

  ///font-weight: w900;
  ///font-size: 16px;
  /// letter spacing: -.41;
  ///color: #black;
  static final subtitle02 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    letterSpacing: -.41,
    fontFamily: "Roboto",
  );

  ///font-weight: w700;
  ///font-size: 17px;
  ///color: #GRAY01;
  static final heading01 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: MesaColorsGuide.GRAY01,
    fontFamily: "Roboto",
  );

  ///font-weight: w500;
  ///font-size: 14px;
  ///color: #GRAY01;
  static final heading02 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: MesaColorsGuide.GRAY01,
    fontFamily: "Roboto",
  );

  ///font-weight: w500;
  ///font-size: 14px;
  ///color: #GRAY02;
  static final heading03 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: MesaColorsGuide.GRAY02,
    fontFamily: "Roboto",
  );

  ///font-weight: w500;
  ///font-size: 10px;
  /// etterSpacing: -.41,
  ///color: #GRAY02;
  static final heading04 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: -.41,
    color: MesaColorsGuide.GRAY02,
    fontFamily: "Roboto",
  );

  ///font-weight: normal;
  ///font-size: 13px;
  /// etterSpacing: -.41,
  ///color: #black;
  ///fontStyle: FontStyle.italic,

  static final heading05 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    letterSpacing: -.41,
    color: Colors.black,
    fontStyle: FontStyle.italic,
    fontFamily: "Roboto",
  );

  ///font-weight: w700;
  ///font-size: 15px;
  ///color: #white;
  static final button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: -.41,
    color: Colors.white,
    fontFamily: "Roboto",
  );
}
