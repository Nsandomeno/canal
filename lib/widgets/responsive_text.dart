import 'dart:math';


import 'package:flutter/material.dart';
import 'package:canal/constants/sizes.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontColor,
    this.fontSize,
    this.alignment,
    this.scaleSize = 2,
  });

  final String text;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final double? fontSize;
  final TextAlign? alignment;
  final double scaleSize;

  double calculateScaleSize(BuildContext context) {
    /// Thanks!
    /// https://stackoverflow.com/a/72841990/22272784
    const MAX_FACTOR = 2.0;

    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * MAX_FACTOR;
    return max(1, min(val, MAX_FACTOR));
  }

  TextStyle mergeStyle() {
    final fontWeightOrDefault = fontWeight ?? FontWeight.normal;
    final fontColorOrDefault = fontColor ?? Colors.black;
    final fontSizeOrDefault = fontSize ?? Sizes.p16;

    return TextStyle(
      color: fontColorOrDefault,
      fontWeight: fontWeightOrDefault,
      fontSize: fontSizeOrDefault,
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeTextScale = calculateScaleSize(context);
    return Text(
      text,
      textAlign: alignment ?? TextAlign.center,
      textScaler: TextScaler.linear(activeTextScale),
      style: mergeStyle(),
    );
  }
}