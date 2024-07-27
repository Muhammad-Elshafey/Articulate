import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';
import '../text_styles.dart';
import 'progress_indicator.dart';

class MaterialButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isLoading;
  const MaterialButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity.sw,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0).r,
          gradient: materialButtonLinearGradient,
        ),
        child: Center(
          child: isLoading
              ? const CustomCircularProgressIndicator()
              : Text(
                  buttonText,
                  style: Styles.text20.copyWith(fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
