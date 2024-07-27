import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import 'user_data_child.dart';

class UserDataParentWidget extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const UserDataParentWidget({
    required this.name,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 3.1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 480.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(46),
            topRight: Radius.circular(46),
          ),
        ),
        child: UserDataChildWidget(
          name: name,
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }
}
