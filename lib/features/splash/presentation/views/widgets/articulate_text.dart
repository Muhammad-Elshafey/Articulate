import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/widgets/gradient_text.dart';

class ArticulateText extends StatelessWidget {
  const ArticulateText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text: AppStrings.splashText,
      gradient: kSplashText,
      style: Styles.splashTextStyle,
    );
  }
}
