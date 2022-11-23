import 'package:flutter/material.dart';

class LWCustomText extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final String? fontFamily;
  final double? letterSpacing;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextBaseline? textBaseline;
  final TextOverflow? overflow;
  final double? wordSpacing;
  final TextDecorationStyle? decorationStyle;
  final TextAlign? textAlign;

  const LWCustomText({
    Key? key,
    required this.title,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.decoration,
    this.fontFamily,
    this.letterSpacing,
    this.decorationColor,
    this.decorationThickness,
    this.textBaseline,
    this.overflow,
    this.wordSpacing,
    this.decorationStyle,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        backgroundColor: backgroundColor,
        color: color,
        fontSize: fontSize,
        decorationStyle: decorationStyle,
        height: height,
        fontWeight: fontWeight,
        decoration: decoration ?? TextDecoration.none,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        textBaseline: textBaseline,
        overflow: overflow,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
