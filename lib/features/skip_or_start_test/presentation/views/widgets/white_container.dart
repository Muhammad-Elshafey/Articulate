import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class WhiteCircleContainer extends StatelessWidget {
  const WhiteCircleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 220.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kWhiteColor,
      ),
    );
  }
}
