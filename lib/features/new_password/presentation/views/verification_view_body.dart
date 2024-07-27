import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:articulate/core/utils/widgets/app_bar.dart';
import 'package:articulate/features/auth/presentation/manager/validate_cubit/validate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../auth/presentation/manager/validate_cubit/validate_state.dart';
import '../../../auth/presentation/manager/visibility_cubit/visibility_cubit.dart';
import '../../../auth/presentation/views/widgets/label.dart';
import '../../../auth/presentation/views/widgets/password_visibility_widget.dart';
import '../../../splash/presentation/views/widgets/bg_splash_image.dart';
import '../manager/forget_pass_cubit/forget_pass_cubit.dart';
import '../manager/forget_pass_cubit/forget_pass_state.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final forgetPassCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    final validateCubit = BlocProvider.of<ValidateCubit>(context);
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          Functions.showToastMessage(
            message: 'We have sent a new link',
            toastLength: Toast.LENGTH_LONG,
          );
        }
        if (state is ForgetPasswordFailure) {
          Functions.showToastMessage(
            message: state.errorMessage,
            toastLength: Toast.LENGTH_LONG,
          );
        }
        if (state is LinkFailure) {
          Functions.showToastMessage(
            message: state.errorMessage,
            toastLength: Toast.LENGTH_LONG,
          );
        }
        if (state is LinkSuccess) {
          Functions.navigateWithReplacement(
            context: context,
            route: Routes.loginRoute,
          );
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LinkLoading ? true : false,
          child: Form(
            autovalidateMode: validateCubit.autovalidateMode,
            key: validateCubit.formKey,
            child: Stack(
              children: [
                const BgSplashImage(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.h),
                        const CustomAppBar(
                            text: AppStrings.verificationCodeScreen),
                        SizedBox(height: 30.h),
                        Center(
                          child: Image.asset(
                            AssetData.verificationImage,
                            scale: 1.2,
                          ),
                        ),
                        SizedBox(height: 35.h),
                        BlocConsumer<ValidateCubit, ValidateState>(
                          listener: (context, state) {
                            if (state is ValidateFailure) {
                              validateCubit.autovalidateMode =
                                  AutovalidateMode.always;
                            }
                            if (state is ValidateSuccess) {
                              forgetPassCubit.newPassword();
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LabelWidget(
                                    text: AppStrings.textFiledLinkLabel),
                                SizedBox(height: 5.h),
                                CustomTextField(
                                  hintText:
                                      'Enter the link you have got in your mail',
                                  textFiledName: 'Link',
                                  controller: forgetPassCubit.linkController,
                                ),
                                SizedBox(height: 15.h),
                                const LabelWidget(
                                    text: AppStrings.textFiledPasswordLabel),
                                SizedBox(height: 5.h),
                                PasswordVisibilityWidget(
                                  textFiledName: 'Password',
                                  visibilityCubit: VisibilityCubit(),
                                  hintText: AppStrings.textFiledPassword,
                                  controller: forgetPassCubit.passController,
                                ),
                                SizedBox(height: 25.h),
                                const LabelWidget(
                                    text: AppStrings
                                        .textFiledSignUpLabelConfirmPassword),
                                SizedBox(height: 5.h),
                                PasswordVisibilityWidget(
                                  textFiledName: 'Confirm Password',
                                  hintText: AppStrings.textFiledConfirmPassword,
                                  visibilityCubit: VisibilityCubit(),
                                  controller:
                                      forgetPassCubit.confirmPassController,
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 25.h),
                        MaterialButtonWidget(
                          buttonText: AppStrings.confirmText,
                          isLoading: state is LinkLoading ? true : false,
                          onPressed: () {
                            validateCubit.validateForm();
                          },
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          AppStrings.waitText,
                          style: Styles.text18.copyWith(
                            color: kBlackColorWithOpacity60,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        TextButton(
                          onPressed: () => forgetPassCubit
                              .getCodeForResetPassword(email: data['email']),
                          child: Text(
                            AppStrings.resendText,
                            style: Styles.text20.copyWith(
                              color: kBlueColor3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
