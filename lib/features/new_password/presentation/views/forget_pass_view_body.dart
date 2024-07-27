import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:articulate/core/utils/common/functions.dart';
import 'package:articulate/core/utils/text_styles.dart';
import 'package:articulate/core/utils/widgets/app_bar.dart';
import 'package:articulate/core/utils/widgets/custom_text_field.dart';
import 'package:articulate/features/auth/presentation/manager/validate_cubit/validate_cubit.dart';
import 'package:articulate/features/auth/presentation/manager/validate_cubit/validate_state.dart';
import 'package:articulate/features/auth/presentation/views/widgets/label.dart';
import 'package:articulate/features/new_password/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../splash/presentation/views/widgets/bg_splash_image.dart';
import '../manager/forget_pass_cubit/forget_pass_state.dart';

class ForgetPassViewBody extends StatefulWidget {
  const ForgetPassViewBody({super.key});

  @override
  State<ForgetPassViewBody> createState() => _ForgetPassViewBodyState();
}

class _ForgetPassViewBodyState extends State<ForgetPassViewBody> {
  @override
  Widget build(BuildContext context) {
    final validateCubit = BlocProvider.of<ValidateCubit>(context);
    final forgetPassCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          Functions.navigateWithReplacement(
              context: context,
              route: Routes.verificationViewRoute,
              data: {'email': forgetPassCubit.emailController.text});
        }
        if (state is ForgetPasswordFailure) {
          Functions.showToastMessage(
            message: state.errorMessage,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is ForgetPasswordLoading ? true : false,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        const CustomAppBar(
                            text: AppStrings.forgotPasswordScreen),
                        SizedBox(height: 100.h),
                        Center(
                          child: Image.asset(
                            AssetData.forgetPassIcon,
                            height: 90.h,
                          ),
                        ),
                        SizedBox(height: 45.h),
                        Text(
                          AppStrings.forgetPasswordScreenText,
                          style: Styles.text20.copyWith(
                            color: kBlueColor4,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        const LabelWidget(text: AppStrings.textFiledEmailLabel),
                        SizedBox(height: 5.h),
                        BlocBuilder<ValidateCubit, ValidateState>(
                          builder: (context, state) {
                            return CustomTextField(
                              hintText: AppStrings.textFiledEmail,
                              textFiledName: 'Email',
                              controller: forgetPassCubit.emailController,
                            );
                          },
                        ),
                        SizedBox(height: 35.h),
                        MaterialButtonWidget(
                          buttonText: AppStrings.sendText,
                          onPressed: () {
                            validateCubit.validateForm();
                            forgetPassCubit.getCodeForResetPassword(
                                email: forgetPassCubit.emailController.text);
                          },
                          isLoading:
                              state is ForgetPasswordLoading ? true : false,
                        ),
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
