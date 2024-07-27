import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final List<String> languages = [
    'English',
    'Spanish',
    'Chinese',
    'Hindi',
    'Arabic',
    'Bengali',
    'Portuguese',
    'Russian',
    'Japanese',
    'German',
    'French',
    'Korean',
    'Italian',
    'Turkish',
    'Vietnamese',
  ];
  String item = 'English';
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        labelText: 'Native Language',
        labelStyle: const TextStyle(
          fontSize: 18,
          color: kSoundColor,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: textFiledBorder(color: kTextFiledBorderColor),
        focusedBorder: textFiledBorder(color: kTextFiledBorderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: Styles.text16.copyWith(
            color: kBlueColor,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          isExpanded: true,
          borderRadius: BorderRadius.circular(8.r),
          value: item,
          items: languages.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              item = newValue!;
            });
          },
        ),
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
