import 'package:articulate/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constant.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../splash/presentation/views/widgets/bg_splash_image.dart';

class ExplainTestViewBody extends StatefulWidget {
  const ExplainTestViewBody({super.key});

  @override
  State<ExplainTestViewBody> createState() => ExplainTestViewBodyState();
}

class ExplainTestViewBodyState extends State<ExplainTestViewBody> {
  final PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BgSplashImage(),
        Center(
          child: Column(
            children: [
              SizedBox(height: 45.h),
              Text(
                AppStrings.readingText,
                style: Styles.text22.copyWith(
                  color: kBlueColor3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80.h),
              SvgPicture.asset(
                AssetData.testImage1,
                width: 240.w,
                height: 240.h,
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.readingBody,
                style: Styles.text20.copyWith(
                  color: kTextFiledIconColor,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
                child: MaterialButtonWidget(
                  buttonText: AppStrings.readingButtonText,
                  onPressed: () => Functions.navigateWithoutReplacement(
                      context: context, route: Routes.testInstructionsRoute),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
