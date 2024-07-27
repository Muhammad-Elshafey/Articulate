import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/gradient_text.dart';
import '../../../data/models/levels_data_model.dart';

class LevelDetails extends StatelessWidget {
  const LevelDetails({
    super.key,
    required this.levelModel,
  });

  final LevelModel levelModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientText(
            style: Styles.gradientText.copyWith(fontSize: 16),
            text: levelModel.title,
            gradient: levelTextLinearGradient,
          ),
          SizedBox(height: 5.h),
          Text(
            levelModel.supTitle,
            style: Styles.gradientText.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kLevelSubTitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
