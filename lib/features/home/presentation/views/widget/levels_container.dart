import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class HomeLevelsContainer extends StatelessWidget {
  final Widget child;
  const HomeLevelsContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: kBlueColor3, width: 3.5.w),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: child,
    );
  }
}
