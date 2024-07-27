import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:articulate/core/utils/common/functions.dart';
import 'package:articulate/core/utils/widgets/custom_text_field.dart';
import 'package:articulate/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:articulate/features/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:articulate/features/auth/presentation/manager/validate_cubit/validate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../../core/utils/widgets/nav.dart';
import '../manager/validate_cubit/validate_state.dart';
import '../manager/visibility_cubit/visibility_cubit.dart';
import 'widgets/custom_drop_down_button.dart';
import 'widgets/label.dart';
import 'widgets/mic_icon.dart';
import 'widgets/password_visibility_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    final validateCubit = BlocProvider.of<ValidateCubit>(context);
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: validateCubit.autovalidateMode,
        key: validateCubit.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is PasswordFailure) {
                Functions.showToastMessage(
                  message: 'Password doesn\'t Confirm password',
                  toastLength: Toast.LENGTH_LONG,
                );
              }
              if (state is SignUpSuccess && state is! PasswordFailure) {
                if (state.signUpModel.user != null) {
                  Functions.navigateWithoutReplacement(
                    context: context,
                    route: Routes.verifyAccountRoute,
                    data: {
                      'email': state.signUpModel.user!.email,
                      'id': state.signUpModel.user!.id,
                      'name': state.signUpModel.user!.name,
                    },
                  );
                }
              }
              if (state is SignUpFailure) {
                Functions.showToastMessage(
                  message: state.errorMessage,
                  toastLength: Toast.LENGTH_LONG,
                );
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is SignUpLoading ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const MicIcon(imagePath: AssetData.signUpLogo, scale: 1),
                    SizedBox(height: 15.h),
                    const LabelWidget(
                        text: AppStrings.textFiledSignUpLabelName),
                    SizedBox(height: 6.h),
                    BlocConsumer<ValidateCubit, ValidateState>(
                      listener: (context, state) {
                        if (state is ValidateFailure) {
                          validateCubit.autovalidateMode =
                              AutovalidateMode.always;
                        }
                        if (state is ValidateSuccess) {
                          signUpCubit.signUp();
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: AppStrings.textFiledSignUpName,
                              textFiledName: 'Name',
                              controller: signUpCubit.nameController,
                            ),
                            SizedBox(height: 15.h),
                            const LabelWidget(
                                text: AppStrings.textFiledEmailLabel),
                            SizedBox(height: 6.h),
                            CustomTextField(
                              hintText: AppStrings.textFiledEmail,
                              textFiledName: 'Email',
                              controller: signUpCubit.emailController,
                            ),
                            SizedBox(height: 15.h),
                            const LabelWidget(
                                text: AppStrings.textFiledPasswordLabel),
                            SizedBox(height: 6.h),
                            PasswordVisibilityWidget(
                              textFiledName: 'Password',
                              visibilityCubit: VisibilityCubit(),
                              hintText: AppStrings.textFiledPassword,
                              controller: signUpCubit.passwordController,
                            ),
                            SizedBox(height: 15.h),
                            const LabelWidget(
                                text: AppStrings
                                    .textFiledSignUpLabelConfirmPassword),
                            SizedBox(height: 6.h),
                            PasswordVisibilityWidget(
                              textFiledName: 'Confirm Password',
                              hintText: AppStrings.textFiledConfirmPassword,
                              visibilityCubit: VisibilityCubit(),
                              controller: signUpCubit.confirmPasswordController,
                            ),
                            SizedBox(height: 20.h),
                            const CustomDropDownButton(),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    MaterialButtonWidget(
                      onPressed: () {
                        validateCubit.validateForm();
                      },
                      buttonText: AppStrings.signUpTextButton,
                      isLoading: state is SignUpLoading ? true : false,
                    ),
                    SizedBox(height: 14.h),
                    NavTextButton(
                      text1: AppStrings.havAnAccountText,
                      text2: AppStrings.loginButtonText,
                      onTap: () => Functions.navigateWithReplacement(
                          context: context, route: Routes.loginRoute),
                    ),
                    SizedBox(height: 25.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
