import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class ContainerForInstructions extends StatelessWidget {
  final String text;
  const ContainerForInstructions({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.sw,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: kBlueColor2,
        ),
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: Center(
        child: Text(
          text,
          style: Styles.text20.copyWith(
            color: kBlackColorWithOpacity70,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
