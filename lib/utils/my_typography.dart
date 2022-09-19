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

  static TextStyle? buttonTextStyle({color}) => TextStyle(
        fontFamily: FontFamily.maisonNeueDemi,
        fontSize: 16,
        height: 20 / 16,
        color: color ?? Colors.black,
      );

  static TextStyle? smallButtonTextStyle({color}) => TextStyle(
        fontFamily: FontFamily.maisonNeueDemi,
        fontSize: 12,
        height: 14 / 12,
        color: color ?? Colors.black,
      );
}
