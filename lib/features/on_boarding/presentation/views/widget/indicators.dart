import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constant.dart';

class Indicators extends StatelessWidget {
  final int count;
  final PageController controller;
  const Indicators({
    Key? key,
    required this.count,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: const WormEffect(
        dotWidth: 11.0,
        dotHeight: 11.0,
        activeDotColor: kIndicatorsColor,
        dotColor: kIndicatorsColor,
        spacing: 16.0,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.5,
      ),
    );
  }
}
