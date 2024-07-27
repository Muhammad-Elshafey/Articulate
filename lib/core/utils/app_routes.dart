import 'package:articulate/features/about_test/presentation/views/test_instructions_view.dart';
import 'package:articulate/features/about_test/presentation/views/test_mic_view.dart';
import 'package:articulate/features/auth/presentation/views/log_in_view.dart';
import 'package:articulate/features/auth/presentation/views/sign_up_view.dart';
import 'package:articulate/features/auth/presentation/views/verify_account_view.dart';
import 'package:articulate/features/home/presentation/views/home_view.dart';
import 'package:articulate/features/skip_or_start_test/presentation/views/skip_test_view.dart';
import 'package:articulate/features/new_password/presentation/views/forget_pass_view.dart';
import 'package:articulate/features/new_password/presentation/views/verification_view.dart';
import 'package:articulate/features/skip_or_start_test/presentation/views/start_screen_view.dart';
import 'package:articulate/features/test_feature/presentation/views/congrats_view.dart';
import 'package:articulate/features/test_feature/presentation/views/test_view.dart';
import 'package:flutter/material.dart';

import '../../features/about_test/presentation/views/explain_text_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class Routes {
  static String splashRoute = '/';
  static String onBoardingRoute = '/onBoarding';
  static String loginRoute = '/login';
  static String signUpRoute = '/sign_up';
  static String forgetPassRoute = '/forget_pass';
  static String verificationViewRoute = '/verification_view';
  static String newPassRoute = '/new_pass_view';
  static String startScreenRoute = '/start_screen';
  static String skipTestRoute = '/skip_test';
  static String explainTestRoute = '/explain_test';
  static String breakRoute = '/break';
  static String homeRoute = '/home';
  static String congratsRoute = '/congrats';
  static String testMicRoute = '/testMic';
  static String verifyAccountRoute = '/verifyAccount';
  static String testInstructionsRoute = '/instructions';
  static String testRoute = '/test';
  static Map<String, Widget Function(BuildContext)> routes = {
    splashRoute: (context) => const SplashView(),
    onBoardingRoute: (context) => const OnBoardingView(),
    loginRoute: (context) => const LoginView(),
    signUpRoute: (context) => const SignUpView(),
    forgetPassRoute: (context) => const ForgetPassView(),
    verificationViewRoute: (context) => const VerificationView(),
    startScreenRoute: (context) => const StartScreen(),
    skipTestRoute: (context) => const SkipTestView(),
    explainTestRoute: (context) => const ExplainTestView(),
    homeRoute: (context) => const HomeView(),
    congratsRoute: (context) => const CongratsView(),
    testMicRoute: (context) => const TestMicView(),
    verifyAccountRoute: (context) => const VerifyAccount(),
    testInstructionsRoute: (context) => const TestInstructionsView(),
    testRoute: (context) => const TestView(),
  };
}
