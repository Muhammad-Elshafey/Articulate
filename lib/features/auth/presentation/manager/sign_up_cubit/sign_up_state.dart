import '../../../data/models/auth_model/auth_model.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final AuthModel signUpModel;

  SignUpSuccess({required this.signUpModel});
}

class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

class PasswordFailure extends SignUpState {}

class ResendOtpFailure extends SignUpState {
  final String errorMessage;

  ResendOtpFailure({required this.errorMessage});
}

class ResendOtpLoading extends SignUpState {}

class ResendOtpSuccess extends SignUpState {}

class VerifyAccountFailure extends SignUpState {
  final String errorMessage;

  VerifyAccountFailure({required this.errorMessage});
}

class VerifyAccountLoading extends SignUpState {}

class VerifyAccountSuccess extends SignUpState {}
