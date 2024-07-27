import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton(
      {super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: 250.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0).r,
            gradient: materialButtonLinearGradient),
        child: Center(
          child: Text(buttonText, style: Styles.text20),
        ),
      ),
    );
  }
}
