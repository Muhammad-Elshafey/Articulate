import 'package:flutter/material.dart';

import '../../../constant.dart';

class UnderlineTextWidget extends StatelessWidget {
  final TextStyle? textStyle;
  final VoidCallback onTap;
  final Color color;
  final String text;
  const UnderlineTextWidget({
    super.key,
    required this.textStyle,
    this.color = kSkipButtonOnboardingColor,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: color,
            ),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
