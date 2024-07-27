import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CustomLessonsDivider extends StatelessWidget {
  const CustomLessonsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Divider(
        thickness: 1.5,
        color: kBlueColor4,
      ),
    );
  }
}
