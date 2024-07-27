import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../data/models/levels_data_model.dart';

class ProgressRow extends StatelessWidget {
  final LevelModel levelModel;

  const ProgressRow({
    super.key,
    required this.levelModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 120,
          animation: true,
          lineHeight: 7.h,
          animationDuration: 2000,
          percent: levelModel.progressPercent,
          barRadius: const Radius.circular(20.0).r,
          linearGradient: levelTextLinearGradient,
        ),
        SizedBox(width: 5.w),
        Text(
          '${(levelModel.progressPercent * 100).toInt()}%',
          style: Styles.text18.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
