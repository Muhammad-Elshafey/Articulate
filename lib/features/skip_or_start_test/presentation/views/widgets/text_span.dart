import 'package:articulate/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class TextWith2Colors extends StatelessWidget {
  const TextWith2Colors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppStrings.embarkText,
            style: Styles.text22.copyWith(
                color: kBlueColor3,
                fontSize: 22,
                fontWeight: FontWeight.normal),
          ),
          TextSpan(
            text: AppStrings.lvl1Text,
            style: Styles.text22.copyWith(color: kBlueColor5, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
