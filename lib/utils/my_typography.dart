import 'package:flutter/material.dart';
import 'package:resfli/gen/fonts.gen.dart';

class MyTypography {
  static TextStyle? headerTitle({color}) => TextStyle(
        fontFamily: FontFamily.maisonNeueBold,
        fontSize: 21,
        height: 28 / 21,
        color: color ?? Colors.black,
      );

  static TextStyle? headerSubtitle({color}) => TextStyle(
        fontFamily: FontFamily.maisonNeueBold,
        fontSize: 21,
        height: 28 / 21,
        color: color ?? Colors.black,
      );

  static TextStyle? contentBoldNormal({color}) => TextStyle(
        fontSize: 16,
        fontFamily: FontFamily.maisonNeueBold,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );

  static TextStyle? contentBoldLarge({color}) => TextStyle(
        fontSize: 24,
        fontFamily: FontFamily.maisonNeueBold,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );

  static TextStyle? buttonSmall({color}) => TextStyle(
        fontSize: 12,
        fontFamily: FontFamily.maisonNeueBook,
        color: color ?? Colors.black,
      );
  static TextStyle? contentNormal({color}) => TextStyle(
        fontSize: 14,
        fontFamily: FontFamily.maisonNeueBook,
        color: color ?? Colors.black,
      );

  static TextStyle? contentSmall({color}) => TextStyle(
        fontSize: 12,
        fontFamily: FontFamily.maisonNeueBook,
        color: color ?? Colors.black,
      );
}
