import 'package:articulate/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../data/models/levels_data_model.dart';

class CircularPercentIndicatorWidget extends StatelessWidget {
  final LevelModel levelModel;
  const CircularPercentIndicatorWidget({
    super.key,
    required this.levelModel,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      linearGradient: circularPercentIndicatorLinearGradient,
      backgroundColor: kBackgroundColorCircularPercentIndicator,
      lineWidth: 3.2.w,
      radius: 20.r,
      percent: levelModel.progressPercent,
      center: levelModel.start == true
          ? Text(
              '${(levelModel.progressPercent * 100).toInt()}',
              style: Styles.text18.copyWith(fontSize: 16),
            )
          : SvgPicture.asset(AssetData.lockIcon, width: 20.w),
    );
  }
}
