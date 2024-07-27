import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class UserPronunciationEvaluation extends StatelessWidget {
  final String score;
  final double percent;
  final String counter;
  final bool visible;
  const UserPronunciationEvaluation({
    Key? key,
    required this.score,
    required this.percent,
    required this.counter,
    this.visible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Row(
        children: [
          Text(counter, style: Styles.text18),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 154,
            animation: true,
            lineHeight: 8.h,
            animationDuration: 2000,
            percent: percent,
            barRadius: const Radius.circular(20.0).r,
            progressColor: kSoundColor,
          ),
          // SizedBox(width: 5.w),
          Text(
            '$score%',
            style: Styles.text18.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
