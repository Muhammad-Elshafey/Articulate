import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../on_boarding/presentation/views/widget/underline_text_padding.dart';
import 'widgets/grad_container.dart';
import 'widgets/start_test_button.dart';
import 'widgets/white_container.dart';

class StartScreenBody extends StatelessWidget {
  const StartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Container(
      width: double.infinity.sw,
      height: double.infinity.sh,
      decoration: BoxDecoration(
        gradient: startScreenLinearGradient,
      ),
      child: Stack(
        children: [
          const Positioned(top: -100, left: -90, child: WhiteCircleContainer()),
          Positioned(
            top: -110,
            left: -100,
            child: GradientContainer(
              gradient: startScreenContainer2LinearGradient,
            ),
          ),
          const Positioned(
              bottom: -100, right: -80, child: WhiteCircleContainer()),
          Positioned(
            bottom: -110,
            right: -90,
            child: GradientContainer(
              gradient: startScreenContainer1LinearGradient,
            ),
          ),
          UnderLineTextPadding(
            textStyle: Styles.text20,
            color: kWhiteColor,
            onTap: () => Functions.navigateWithoutReplacement(
                context: context, route: Routes.skipTestRoute),
            text: AppStrings.skipTestButton,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome ,${data['name']}!\nReady to determine your language proficiency level?\nTake our assessment test now and discover where you stand!',
                  style: Styles.text20,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35.h),
                RoundedButton(
                  onPressed: () => Functions.navigateWithReplacement(
                      context: context, route: Routes.testMicRoute),
                  color: kWhiteColor,
                  iconColor: kBlueColor3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
