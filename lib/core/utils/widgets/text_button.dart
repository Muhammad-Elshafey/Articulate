import 'package:flutter/material.dart';

class TextButtonItem extends StatelessWidget {
  const TextButtonItem(
      {super.key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      this.fontWeight = FontWeight.w400});

  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
