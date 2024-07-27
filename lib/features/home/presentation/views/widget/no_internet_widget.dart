import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetData.noWifi,
              height: 100.h,
            ),
            SizedBox(height: 20.h),
            const Text(
              'No Internet Connection :(',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff0584FF),
              ),
            ),
            SizedBox(height: 10.h),
            const Text(
              'Please check your Internet Connection\nyou are offline right now',
              style: TextStyle(
                fontSize: 14,
                color: kGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
