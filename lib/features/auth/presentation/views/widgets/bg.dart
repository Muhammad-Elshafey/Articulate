import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';

class AuthBg extends StatelessWidget {
  const AuthBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetData.bottomCurve,
      width: double.infinity.sw,
      height: double.infinity.sh,
      fit: BoxFit.cover,
    );
  }
}
