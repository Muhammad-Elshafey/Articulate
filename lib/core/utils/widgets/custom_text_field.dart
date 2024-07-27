import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool needIcon;
  final bool needOnPressed;
  final bool clickButton;
  final String textFiledName;
  final String? labelText;
  final VoidCallback? onPressed;
  final Color color;
  final TextEditingController controller;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.needIcon = false,
    required this.textFiledName,
    this.clickButton = false,
    this.onPressed,
    this.needOnPressed = false,
    required this.controller,
    this.labelText,
    this.color = kTextFiledHintTextColor,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$textFiledName is required';
        }
        return null;
      },
      obscureText: obscureText,
      obscuringCharacter: '*',
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 18,
          color: kBlackColor,
        ),
        errorStyle: const TextStyle(fontSize: 14.0),
        contentPadding: EdgeInsets.all(12.r),
        hintText: hintText,
        suffixIcon: needIcon
            ? IconButton(
                icon: Icon(suffixIcon, color: kTextFiledIconColor, size: 22),
                onPressed: needOnPressed ? onPressed : () {},
              )
            : const Icon(null),
        hintStyle: TextStyle(
          fontSize: 16,
          color: color,
        ),
        enabledBorder: textFiledBorder(color: kTextFiledBorderColor),
        focusedBorder: textFiledBorder(color: kTextFiledBorderColor),
        errorBorder: textFiledBorder(color: kRedColor),
        focusedErrorBorder: textFiledBorder(color: kRedColor),
      ),
    );
  }

  OutlineInputBorder textFiledBorder({required Color color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: color,
          width: 1.5,
        ),
      );
}
