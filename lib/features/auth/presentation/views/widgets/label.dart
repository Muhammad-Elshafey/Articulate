import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class LabelWidget extends StatelessWidget {
  final String text;
  const LabelWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.text16.copyWith(
        color: kBlueColor,
      ),
      textAlign: TextAlign.start,
    );
  }
}
