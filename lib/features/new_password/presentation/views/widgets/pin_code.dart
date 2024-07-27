import 'package:articulate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 45.h,
      textStyle: const TextStyle(
          fontSize: 20, color: kBlueColor3, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
          color: kOtpTextColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme,
      onCompleted: (String pin) {
        BlocProvider.of<SignUpCubit>(context).pinCode = pin;
      },
    );
  }
}
