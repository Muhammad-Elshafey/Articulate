import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class RatingRow extends StatelessWidget {
  final double rate;
  final Color filledColor;
  final Color unfilledColor;
  const RatingRow({
    super.key,
    required this.rate,
    this.filledColor = Colors.yellowAccent,
    this.unfilledColor = kDividerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.w,
      height: 19.h,
      decoration: BoxDecoration(
        color: kGreyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) {
            final isFilled = index < rate;
            return Icon(
              isFilled ? Icons.star : Icons.star_border,
              color: isFilled ? filledColor : unfilledColor,
              size: 22,
            );
          },
        ),
      ),
    );
  }
}
