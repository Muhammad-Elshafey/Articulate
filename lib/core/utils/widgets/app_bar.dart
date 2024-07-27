import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constant.dart';

import '../text_styles.dart';
import 'back_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const BackIcon(),
          Expanded(
            child: Text(
              text,
              style: Styles.text18.copyWith(color: kBlueColor3, fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
