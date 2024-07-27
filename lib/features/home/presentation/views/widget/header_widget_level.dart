import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/common/enum_level.dart';
import '../../../../../core/utils/text_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.determineLevel,
  });

  final DetermineLevel determineLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.sw,
      decoration: BoxDecoration(
        border: Border.all(color: kBlueColor3, width: 3.w),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          Text(
            LevelEnum.getAppBarTitleForLevel(determineLevel: determineLevel),
            style: Styles.text22.copyWith(fontSize: 20),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              LevelEnum.getAppBarSubTitleForForLevel(
                  determineLevel: determineLevel),
              style: Styles.text16Inter.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
