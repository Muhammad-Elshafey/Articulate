import 'package:articulate/features/auth/data/models/auth_model/auth_model.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final AuthModel authModel;

  SignInSuccess({required this.authModel});
}

class SignInFailure extends SignInState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}
