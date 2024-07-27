part of 'get_user_data_cubit.dart';

abstract class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataLoading extends GetUserDataState {}

final class GetUserDataFailure extends GetUserDataState {
  final String errorMessage;

  GetUserDataFailure({required this.errorMessage});
}

final class GetUserDataSuccess extends GetUserDataState {}
