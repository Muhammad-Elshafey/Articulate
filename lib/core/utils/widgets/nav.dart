import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../text_styles.dart';
import 'text_button.dart';

class NavTextButton extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onTap;
  const NavTextButton({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Styles.text18.copyWith(
            color: const Color(0xff1E1E1E).withOpacity(0.75),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: TextButtonItem(
            text: text2,
            textColor: kBlueColor2,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
