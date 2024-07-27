import 'package:articulate/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nativeLanguageController =
      TextEditingController();
  String pinCode = '';
  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      emit(PasswordFailure());
    }
    emit(SignUpLoading());
    var result = await authRepo.signUpMethod(
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text);
    result.fold((failure) {
      emit(SignUpFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(SignUpSuccess(signUpModel: success));
    });
  }

  Future<void> verifyAccount({required String id, required String otp}) async {
    emit(VerifyAccountLoading());
    var result = await authRepo.verifyAccountMethod(userId: id, otp: otp);
    result.fold((failure) {
      emit(VerifyAccountFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(VerifyAccountSuccess());
    });
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoading());
    var result = await authRepo.resendOtp(email: email);
    result.fold((failure) {
      emit(ResendOtpFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(ResendOtpSuccess());
    });
  }
}
