import 'package:flutter/material.dart';

import 'package:starter_project_flutter/constants/themes/color.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    headline4: kDisplay1,
    headline5: kHeadline,
    headline6: kTitle,
    subtitle2: kSubtitle,
    bodyText2: kBody2,
    bodyText1: kBody1,
    caption: kCaption,
  );
  static ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: kPrimaryColor,
    textTheme: AppTheme.textTheme,
    fontFamily: "Roboto",
  );

  static TextStyle kDisplay1 = const TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle kHeadline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle kTitle = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle kSubtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle kBody2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle kBody1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle kCaption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle kHeadingTextStyle = TextStyle(
    fontSize: 28,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kSubheadingTextStyle = TextStyle(
    fontSize: 24,
    color: Color(0xFF61688B),
    height: 2,
  );

  static const TextStyle kTitleTextStyle = TextStyle(
    fontSize: 20,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kSubtitleTextStyle = TextStyle(
    fontSize: 18,
    color: kTextColor,
    // fontWeight: FontWeight.bold,
  );
}
