import 'package:articulate/constant.dart';
import 'package:articulate/core/data_base/cache_helper.dart';
import 'package:articulate/core/data_base/cached_key.dart';
import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:articulate/core/utils/common/functions.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:articulate/core/utils/widgets/gradient_button.dart';
import 'package:articulate/features/splash/presentation/views/widgets/bg_splash_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_routes.dart';
import 'widgets/text_with_icon.dart';

class CongratsViewBody extends StatelessWidget {
  const CongratsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BgSplashImage(),
        SizedBox(
          width: double.infinity.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.h),
              SvgPicture.asset(AssetData.congratsImage, width: 300.w),
              SizedBox(height: 35.h),
              Text('You’ve reached level 1',
                  style: Styles.text22.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You’re Score is : ',
                      style: Styles.text22.copyWith(
                          color: kBlueColor3, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                  Text('42.23%',
                      style: Styles.text22.copyWith(
                          color: kBlueColor3, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 15.h),
              const TextWithIcon(),
              SizedBox(height: 35.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MaterialButtonWidget(
                  buttonText: AppStrings.continueText,
                  onPressed: () {
                    getIt<CacheHelper>()
                        .saveData(key: CachedKeys.congratsKey, value: true)
                        .then(
                          (value) => Functions.navigateWithReplacement(
                              context: context, route: Routes.homeRoute),
                        );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
