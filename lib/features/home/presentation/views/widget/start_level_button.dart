import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../data/models/levels_data_model.dart';

class StartButtonForLevel extends StatelessWidget {
  final VoidCallback onPressed;
  final LevelModel levelModel;
  final String text;
  final double width;
  const StartButtonForLevel({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 75,
    required this.levelModel,
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
              child: levelModel.start == true
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
