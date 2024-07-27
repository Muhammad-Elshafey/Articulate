import 'dart:io';

import 'package:articulate/features/material/presentation/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constant.dart';
import '../../data_base/cache_helper.dart';
import '../../data_base/cached_key.dart';
import '../../services/service_locator.dart';
import '../app_routes.dart';
import '../text_styles.dart';

class Functions {
  static void navigateWithReplacement(
      {required BuildContext context,
      required String route,
      Map<String, dynamic>? data}) {
    Navigator.pushReplacementNamed(context, route, arguments: data);
  }

  static void navigateWithoutReplacement(
      {required BuildContext context,
      required String route,
      Map<String, dynamic>? data}) {
    Navigator.pushNamed(context, route, arguments: data);
  }

  static Future<bool?> showToastMessage(
      {required String message, toastLength = Toast.LENGTH_LONG}) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.deepPurple,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static Future<void> splashViewNavigateMethod(
      {required BuildContext context}) {
    bool testDone =
        getIt<CacheHelper>().getData(key: CachedKeys.congratsKey) ?? false;
    bool skipTestVisited =
        getIt<CacheHelper>().getData(key: CachedKeys.skipTesKey) ?? false;
    bool isVisited = false;
    if (testDone == true || skipTestVisited == true) {
      isVisited = true;
    }
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        Functions.navigateWithReplacement(
          context: context,
          route: isVisited == true ? Routes.homeRoute : Routes.onBoardingRoute,
        );
      },
    );
  }

  static TextStyle getTimerStyleInTest(int seconds) {
    if (seconds == 0) {
      return Styles.text18.copyWith(
        color: kWhiteColor,
        fontSize: 22,
      );
    } else if (seconds <= 5) {
      return Styles.text18.copyWith(
        color: kRedColor,
        fontSize: 22,
      );
    } else {
      return Styles.text18.copyWith(
        color: kWhiteColor,
        fontSize: 22,
      );
    }
  }

  static String splitUrl(String url) {
    List a = url.split("/");
    return a[a.length - 1];
  }

  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  static void openWebView(
      {required BuildContext context,
      required String url,
      required String text}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return WebViewPage(url: url, text: text);
        },
      ),
    );
  }
}
