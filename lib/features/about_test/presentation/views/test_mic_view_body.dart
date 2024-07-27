import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:articulate/core/utils/common/functions.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:articulate/core/utils/widgets/gradient_button.dart';
import 'package:articulate/features/splash/presentation/views/widgets/bg_splash_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../constant.dart';
import '../../../../core/utils/app_routes.dart';

class TestMicViewBody extends StatelessWidget {
  const TestMicViewBody({super.key});

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
              SizedBox(height: 140.h),
              Text(
                AppStrings.testMicText,
                style: Styles.text20.copyWith(
                  color: kBlueColor3,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                AppStrings.testMicBodyText,
                style: Styles.text22.copyWith(
                  color: kBlackColorWithOpacity60,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              Image.asset(
                AssetData.homeMic,
                scale: 3.5,
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: MaterialButtonWidget(
                  buttonText: AppStrings.testMicButtonText,
                  onPressed: () async {
                    await requestMicrophonePermission(context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> requestMicrophonePermission(
      {required BuildContext context}) async {
    var status = await Permission.microphone.status;
    if (status.isDenied) {
      PermissionStatus permissionStatus = await Permission.microphone.request();
      if (permissionStatus.isGranted) {
        Functions.showToastMessage(message: 'Ready to go');
        Future.delayed(
          const Duration(seconds: 2),
          () => Functions.navigateWithReplacement(
              context: context, route: Routes.explainTestRoute),
        );
      } else {
        Functions.showToastMessage(message: 'Microphone permission denied.');
        openAppSettings();
      }
    } else if (status.isGranted) {
      Functions.showToastMessage(message: 'Ready to go');
      Future.delayed(
        const Duration(seconds: 2),
        () => Functions.navigateWithReplacement(
            context: context, route: Routes.explainTestRoute),
      );
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
