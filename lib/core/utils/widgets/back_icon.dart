import 'package:flutter/material.dart';

import '../../../constant.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: kTextFiledIconColor,
        size: 22,
      ),
    );
  }
}
