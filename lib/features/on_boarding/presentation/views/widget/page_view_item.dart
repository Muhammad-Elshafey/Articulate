import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:articulate/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/common/functions.dart';
import 'indicators.dart';
import 'on_boarding_button.dart';
import 'underline_text_padding.dart';

class PageViewItem extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  final PageController pageController;
  const PageViewItem({
    super.key,
    required this.onBoardingModel,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!onBoardingModel.isLastPage)
          UnderLineTextPadding(
            textStyle: Styles.text20.copyWith(color: kBlueColor3),
            onTap: () => Functions.navigateWithReplacement(
                context: context, route: Routes.loginRoute),
            text: AppStrings.skipText,
          ),
        if (onBoardingModel.isLastPage) SizedBox(height: 79.h),
        SizedBox(height: 20.h),
        SvgPicture.asset(
          onBoardingModel.imagePath,
          width: 260.w,
          height: 270.h,
        ),
        SizedBox(height: 30.h),
        Text(
          onBoardingModel.text1,
          style: Styles.text22,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Text(
            onBoardingModel.text2,
            style: Styles.text16.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 35.h),
        OnBoardingButton(
          buttonText: onBoardingModel.elevatedButtonText,
          onPressed: () {
            if (!onBoardingModel.isLastPage) {
              if (pageController.page != 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeInOut,
                );
              }
            } else {
              Functions.navigateWithReplacement(
                  context: context, route: Routes.loginRoute);
            }
          },
        ),
        SizedBox(height: 18.h),
        Indicators(
          count: 3,
          controller: pageController,
        ),
      ],
    );
  }
}
