import 'package:articulate/core/utils/app_strings.dart';
import 'package:articulate/core/utils/common/functions.dart';
import 'package:articulate/core/utils/widgets/custom_text_field.dart';
import 'package:articulate/features/auth/presentation/manager/visibility_cubit/visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../../core/utils/widgets/nav.dart';
import '../manager/sign_in_cubit/sign_in_cubit.dart';
import '../manager/sign_in_cubit/sign_in_state.dart';
import '../manager/validate_cubit/validate_cubit.dart';
import '../manager/validate_cubit/validate_state.dart';
import 'widgets/forget_password.dart';
import 'widgets/label.dart';
import 'widgets/mic_icon.dart';
import 'widgets/password_visibility_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final validateCubit = BlocProvider.of<ValidateCubit>(context);
    final signInCubit = BlocProvider.of<SignInCubit>(context);
    final visibilityCubit = BlocProvider.of<VisibilityCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
      child: SingleChildScrollView(
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              if (state.authModel.user != null) {
                Functions.navigateWithReplacement(
                  context: context,
                  route: Routes.startScreenRoute,
                  data: {
                    'name': state.authModel.user!.name,
                  },
                );
              }
            }
            if (state is SignInFailure) {
              Functions.showToastMessage(
                message: state.errorMessage,
                toastLength: Toast.LENGTH_LONG,
              );
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is SignInLoading ? true : false,
              child: Form(
                autovalidateMode: validateCubit.autovalidateMode,
                key: validateCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 40.0).r,
                      child: const MicIcon(
                        imagePath: AssetData.loginLogo,
                        scale: 0.9,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const LabelWidget(text: AppStrings.textFiledEmailLabel),
                    SizedBox(height: 5.h),
                    BlocConsumer<ValidateCubit, ValidateState>(
                      listener: (context, state) {
                        if (state is ValidateFailure) {
                          validateCubit.autovalidateMode =
                              AutovalidateMode.always;
                        }
                        if (state is ValidateSuccess) {
                          signInCubit.signIn();
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: AppStrings.textFiledEmail,
                              textFiledName: 'Email',
                              controller: signInCubit.emailController,
                            ),
                            SizedBox(height: 20.h),
                            const LabelWidget(
                                text: AppStrings.textFiledPasswordLabel),
                            SizedBox(height: 5.h),
                            PasswordVisibilityWidget(
                              textFiledName: 'Password',
                              hintText: AppStrings.textFiledPassword,
                              visibilityCubit: visibilityCubit,
                              controller: signInCubit.passwordController,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    const ForgetPasswordWidget(),
                    SizedBox(height: 25.h),
                    MaterialButtonWidget(
                      onPressed: () {
                        validateCubit.validateForm();
                      },
                      buttonText: AppStrings.loginButtonText,
                      isLoading: state is SignInLoading ? true : false,
                    ),
                    SizedBox(height: 15.h),
                    NavTextButton(
                      text1: AppStrings.noAccountText,
                      text2: AppStrings.signUpTextButton,
                      onTap: () => Functions.navigateWithReplacement(
                          context: context, route: Routes.signUpRoute),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
