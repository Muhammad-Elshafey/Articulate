import 'package:articulate/core/utils/common/enum_level.dart';
import 'package:articulate/features/home/presentation/views/lesson_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/gradient_text.dart';
import '../../../data/models/lessons_model.dart';
import '../../../data/models/lessons_progress_model.dart';
import 'lessons_progress.dart';

class LessonDetails extends StatelessWidget {
  final LessonsModel lessonsModel;
  final int index;
  final LessonsProgressModel lessonsProgressModel;
  const LessonDetails({
    super.key,
    required this.lessonsModel,
    required this.index,
    required this.lessonsProgressModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          style: Styles.gradientText.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          text: lessonsModel.sound!,
          gradient: levelTextLinearGradient,
        ),
        if (LevelEnum.currentIndexForLevel != 2) SizedBox(height: 8.h),
        if (LevelEnum.currentIndexForLevel != 2)
          Text(
            lessonsModel.description!,
            style: Styles.text16Inter.copyWith(fontSize: 14),
          ),
        SizedBox(height: 5.h),
        LessonProgress(
          lessonsProgressModel: lessonsProgressModel,
          lessonsProgressModelList: LevelEnum.detectList(index: index),
        ),
        SizedBox(height: 5.h),
        StartButtonForLessons(
          onPressed: () {
            LevelEnum.currentIndexForLesson = index;
            if (lessonsProgressModel.start == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonView(index: index),
                ),
              );
            }
          },
          text: lessonsProgressModel.score == 0 ? 'Start' : 'Continue',
          width: 70,
          lessonsProgressModel: lessonsProgressModel,
        ),
      ],
    );
  }
}

class StartButtonForLessons extends StatelessWidget {
  final LessonsProgressModel lessonsProgressModel;
  final VoidCallback onPressed;
  final String text;
  final double width;
  const StartButtonForLessons({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 75,
    required this.lessonsProgressModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: onPressed,
          child: Container(
            width: width.w,
            height: 26.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0).r,
              gradient: materialButtonLinearGradient,
            ),
            child: Center(
              child: lessonsProgressModel.start == true
                  ? Text(
                      text,
                      style: Styles.text20.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SvgPicture.asset(
                      AssetData.lockIcon,
                      width: 22.w,
                      // ignore: deprecated_member_use
                      color: kWhiteColor,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
