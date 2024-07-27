import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/levels_data_model.dart';
import 'circle_percent.dart';
import 'level_detail.dart';

class AboutLevelRow extends StatelessWidget {
  const AboutLevelRow({
    super.key,
    required this.levelModel,
  });

  final LevelModel levelModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicatorWidget(levelModel: levelModel),
        SizedBox(width: 15.w),
        LevelDetails(levelModel: levelModel),
      ],
    );
  }
}
