import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:articulate/features/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:articulate/features/auth/presentation/manager/validate_cubit/validate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constant.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/app_bar.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../new_password/presentation/views/widgets/pin_code.dart';
import '../../../splash/presentation/views/widgets/bg_splash_image.dart';
import '../manager/sign_up_cubit/sign_up_cubit.dart';
import '../manager/validate_cubit/validate_cubit.dart';

class VerifyAccountBody extends StatelessWidget {
  const VerifyAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    final validateCubit = BlocProvider.of<ValidateCubit>(context);
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);
    var userData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Form(
      autovalidateMode: validateCubit.autovalidateMode,
      key: validateCubit.formKey,
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is VerifyAccountSuccess) {
            Functions.navigateWithoutReplacement(
              context: context,
              route: Routes.startScreenRoute,
              data: {
                'name': userData['name'],
              },
            );
          }
          if (state is VerifyAccountFailure) {
            Functions.showToastMessage(
              message: state.errorMessage,
              toastLength: Toast.LENGTH_LONG,
            );
          }
          if (state is ResendOtpFailure) {
            Functions.showToastMessage(
              message: state.errorMessage,
              toastLength: Toast.LENGTH_LONG,
            );
          }
          if (state is ResendOtpSuccess) {
            Functions.showToastMessage(
              message: 'We have sent a new one',
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is VerifyAccountLoading ? true : false,
            child: Stack(
              children: [
                const BgSplashImage(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 25.h),
                        const CustomAppBar(text: AppStrings.verifyAccountText),
                        SizedBox(height: 80.h),
                        Center(
                          child: Image.asset(
                            AssetData.verifyAccount,
                            height: 100.h,
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          'Please enter the 4 digit code\nhas been sent to ${data['email']}',
                          style: Styles.text20.copyWith(
                            color: kBlueColor4,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25.h),
                        BlocConsumer<ValidateCubit, ValidateState>(
                          listener:
                              (BuildContext context, ValidateState state) {
                            if (state is ValidateFailure) {
                              validateCubit.autovalidateMode =
                                  AutovalidateMode.always;
                            }
                            if (state is ValidateSuccess) {
                              String id = data['id'].toString();
                              signUpCubit.verifyAccount(
                                  id: id, otp: signUpCubit.pinCode);
                            }
                          },
                          builder: (context, state) {
                            return const PinCode();
                          },
                        ),
                        SizedBox(height: 35.h),
                        MaterialButtonWidget(
                          buttonText: AppStrings.confirmText,
                          onPressed: () => validateCubit.validateForm(),
                          isLoading:
                              state is VerifyAccountLoading ? true : false,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          AppStrings.waitText,
                          style: Styles.text18.copyWith(
                            color: kBlackColorWithOpacity60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextButton(
                          onPressed: () =>
                              signUpCubit.resendOtp(email: data['email']),
                          child: state is ResendOtpLoading
                              ? const CustomCircularProgressIndicator(
                                  color: kBlueColor3)
                              : Text(
                                  AppStrings.resendText,
                                  style: Styles.text20.copyWith(
                                    color: kBlueColor3,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
