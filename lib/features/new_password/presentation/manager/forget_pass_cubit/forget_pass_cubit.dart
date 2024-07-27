import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../data/repos/reset_password_repo.dart';
import 'forget_pass_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ResetPasswordRepo resetPasswordRepo;
  ForgetPasswordCubit({required this.resetPasswordRepo})
      : super(ForgetPasswordInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  Future<void> getCodeForResetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    var result = await resetPasswordRepo.forgetPassword(
      email: email,
    );
    result.fold((failure) {
      emit(ForgetPasswordFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(ForgetPasswordSuccess());
    });
  }

  Future<void> newPassword() async {
    emit(LinkLoading());
    var result = await resetPasswordRepo.resetPassword(
      password: passController.text,
      confirmPassword: confirmPassController.text,
      endpoint: Functions.splitUrl(linkController.text),
    );
    result.fold((failure) {
      emit(LinkFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(LinkSuccess());
    });
  }
}
