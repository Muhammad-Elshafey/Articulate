import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';

class LineBgWidget extends StatelessWidget {
  final Widget child;
  const LineBgWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.sw,
      height: double.infinity.sh,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetData.splashBg),
        ),
      ),
      child: child,
    );
  }
}
