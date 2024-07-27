import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SignInCubit({required this.authRepo}) : super(SignInInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> signIn() async {
    emit(SignInLoading());
    var result = await authRepo.signInMethod(
        password: passwordController.text, email: emailController.text);
    result.fold((failure) {
      emit(SignInFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(SignInSuccess(authModel: success));
    });
  }
}
