import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/app_routes.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/data_base/cache_helper.dart';
import '../../../../core/data_base/cached_key.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../../core/utils/widgets/app_bar.dart';
import 'widgets/start_test_button.dart';
import 'widgets/text_span.dart';

class SkipTestViewBody extends StatelessWidget {
  const SkipTestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30.h),
        const CustomAppBar(
          text: AppStrings.skipTestScreenText,
        ),
        SizedBox(height: 40.h),
        SvgPicture.asset(
          AssetData.welcomeImageAfterSkipTest,
          height: 280.h,
        ),
        SizedBox(height: 25.h),
        const TextWith2Colors(),
        SizedBox(height: 25.h),
        RoundedButton(
          onPressed: () {
            getIt<CacheHelper>()
                .saveData(key: CachedKeys.skipTesKey, value: true)
                .then(
                  (value) => Functions.navigateWithReplacement(
                      context: context, route: Routes.homeRoute),
                );
          },
          color: kBlueColor3,
          iconColor: kWhiteColor,
        ),
      ],
    );
  }
}
