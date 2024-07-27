import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color color;
  const CustomCircularProgressIndicator({
    super.key,
    this.color = kWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
