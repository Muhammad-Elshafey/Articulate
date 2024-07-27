import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:articulate/features/home/data/models/lessons_progress_model.dart';
import 'package:articulate/features/home/data/models/levels_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/common/enum_level.dart';
import 'about_level_row.dart';
import 'progress_row.dart';
import 'start_level_button.dart';

class LevelItemWidget extends StatelessWidget {
  final LevelModel levelModel;
  final int index;
  const LevelItemWidget({
    super.key,
    required this.levelModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          AboutLevelRow(levelModel: levelModel),
          SizedBox(height: 3.h),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              AppStrings.progressText,
              style: Styles.text18Inter.copyWith(fontSize: 14),
            ),
          ),
          ProgressRow(levelModel: levelModel),
          SizedBox(height: 3.h),
          StartButtonForLevel(
            onPressed: () {
              LevelEnum.determineInstructionsRoute(
                  index: index, context: context);
              switch (LevelEnum.currentIndexForLevel) {
                case 0:
                  LessonsProgressModel.levelOneList[0].start = true;
                  break;
                case 1:
                  LessonsProgressModel.levelTwoList[0].start = true;
                  break;
                case 2:
                  LessonsProgressModel.levelThreeList[0].start = true;
                  break;
              }
            },
            text: AppStrings.continueText,
            levelModel: levelModel,
          ),
          if (index == 2) SizedBox(height: 3.h),
        ],
      ),
    );
  }
}
