import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color color;
  final bool underline;

  const CustomText({
    required this.text,
    this.fontSize = 16.0,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.underline = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
    );

    return Text(
      text,
      textAlign: textAlign,
      style: textStyle,
    );
  }
}