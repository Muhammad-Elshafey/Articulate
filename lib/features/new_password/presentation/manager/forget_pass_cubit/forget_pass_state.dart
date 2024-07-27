abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordFailure({required this.errorMessage});
}

class LinkLoading extends ForgetPasswordState {}

class LinkSuccess extends ForgetPasswordState {}

class LinkFailure extends ForgetPasswordState {
  final String errorMessage;

  LinkFailure({required this.errorMessage});
}
