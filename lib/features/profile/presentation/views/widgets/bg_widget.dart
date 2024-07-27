import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class BgWidget extends StatelessWidget {
  const BgWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.sw,
      height: double.infinity.sh,
      decoration: BoxDecoration(
        gradient: profileViewLinearGradient,
      ),
    );
  }
}
