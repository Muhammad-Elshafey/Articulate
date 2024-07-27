import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';

class GoodLuckWidget extends StatelessWidget {
  const GoodLuckWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            AppStrings.luck,
            style: Styles.text22.copyWith(
              color: kBlueColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Image.asset(AssetData.goodLuckImage),
      ],
    );
  }
}
