import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/widgets/underline_text.dart';

class UnderLineTextPadding extends StatelessWidget {
  final TextStyle? textStyle;
  final VoidCallback onTap;
  final Color color;
  final String text;
  const UnderLineTextPadding({
    super.key,
    this.textStyle,
    required this.onTap,
    this.color = kSkipButtonOnboardingColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          UnderlineTextWidget(
            textStyle: textStyle,
            onTap: onTap,
            text: text,
            color: color,
          ),
        ],
      ),
    );
  }
}
