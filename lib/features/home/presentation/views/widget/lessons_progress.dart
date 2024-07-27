import 'package:articulate/core/utils/common/enum_level.dart';
import 'package:articulate/features/home/data/models/lessons_progress_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class LessonProgress extends StatelessWidget {
  final LessonsProgressModel lessonsProgressModel;
  final List<LessonsProgressModel> lessonsProgressModelList;
  const LessonProgress({
    super.key,
    required this.lessonsProgressModel,
    required this.lessonsProgressModelList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 120,
          animation: false,
          lineHeight: 7.h,
          percent: lessonsProgressModel.percent,
          barRadius: const Radius.circular(20.0).r,
          linearGradient: levelTextLinearGradient,
        ),
        SizedBox(width: 5.w),
        Text(
          LevelEnum.currentIndexForLevel == 2
              ? '${lessonsProgressModel.score}/1'
              : '${lessonsProgressModel.score}/20',
          style: Styles.text18.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
