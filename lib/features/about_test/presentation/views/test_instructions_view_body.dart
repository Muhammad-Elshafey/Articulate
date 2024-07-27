import 'package:articulate/features/splash/presentation/views/widgets/bg_splash_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/app_bar.dart';
import '../../../skip_or_start_test/presentation/views/widgets/start_test_button.dart';
import 'widgets/custom_container.dart';
import 'widgets/luck_widget.dart';

class TestInstructionsViewBody extends StatelessWidget {
  const TestInstructionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BgSplashImage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(height: 35.h),
              const CustomAppBar(text: AppStrings.readingText),
              SizedBox(height: 60.h),
              Text(
                AppStrings.instructions,
                style: Styles.text22.copyWith(
                  color: kBlueColor3,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 45.h),
              const ContainerForInstructions(
                  text: AppStrings.instruction1ForReading),
              SizedBox(height: 35.h),
              const ContainerForInstructions(text: AppStrings.instruction2),
              SizedBox(height: 35.h),
              const ContainerForInstructions(text: AppStrings.instruction3),
              SizedBox(height: 35.h),
              const GoodLuckWidget(),
              SizedBox(height: 25.h),
              RoundedButton(
                onPressed: () => Functions.navigateWithReplacement(
                    context: context, route: Routes.testRoute),
                color: kBlueColor3,
                iconColor: kWhiteColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
