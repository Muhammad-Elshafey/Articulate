import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String text1;
  final String text2;
  final String elevatedButtonText;
  final bool isLastPage;

  OnBoardingModel({
    required this.imagePath,
    required this.text1,
    this.isLastPage = false,
    required this.text2,
    required this.elevatedButtonText,
  });
  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      imagePath: AssetData.onBoarding1,
      elevatedButtonText: 'Next',
      text1: AppStrings.onBoarding1HeaderText,
      text2: AppStrings.onBoarding1BottomText,
    ),
    OnBoardingModel(
      imagePath: AssetData.onBoarding2,
      elevatedButtonText: 'Next',
      text2: AppStrings.onBoarding2BottomText,
      text1: AppStrings.onBoarding2HeaderText,
    ),
    OnBoardingModel(
      imagePath: AssetData.onBoarding3,
      elevatedButtonText: 'Get Started',
      text2: AppStrings.onBoarding3BottomText,
      text1: AppStrings.onBoarding3HeaderText,
      isLastPage: true,
    ),
  ];
}
