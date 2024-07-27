import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;
  const CustomDivider({
    super.key,
    required this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Divider(
      color: kDividerColor,
      thickness: thickness,
      indent: mediaQuery.width / 16,
      endIndent: mediaQuery.width / 16,
    );
  }
}
