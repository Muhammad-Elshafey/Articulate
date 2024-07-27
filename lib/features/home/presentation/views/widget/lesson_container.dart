import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class LessonsContainer extends StatelessWidget {
  final Widget child;
  const LessonsContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: kBlueColor3, width: 3.2.w),
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: child,
    );
  }
}
