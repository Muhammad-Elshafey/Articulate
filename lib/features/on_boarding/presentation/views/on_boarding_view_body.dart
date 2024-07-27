import 'package:articulate/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

import 'widget/page_view_item.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => OnBoardingViewBodyState();
}

class OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: OnBoardingModel.onBoardingList.length,
      itemBuilder: (BuildContext context, int index) {
        return PageViewItem(
          onBoardingModel: OnBoardingModel.onBoardingList[index],
          pageController: pageController,
        );
      },
    );
  }
}
