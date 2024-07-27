part of 'update_user_data_cubit.dart';

abstract class UpdateUserDataState {}

class UpdateUserDataInitial extends UpdateUserDataState {}

class UpdateUserDataLoading extends UpdateUserDataState {}

class UpdateUserDataSuccess extends UpdateUserDataState {
  final UserInfo userInfo;

  UpdateUserDataSuccess({required this.userInfo});
}

class UpdateUserDataFailure extends UpdateUserDataState {
  final String errorMessage;

  UpdateUserDataFailure({required this.errorMessage});
}
