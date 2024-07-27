import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Great job!',
          style: Styles.text22.copyWith(
            color: kBlackColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 10.w),
        Image.asset(
          AssetData.medalIcon,
        ),
      ],
    );
  }
}
