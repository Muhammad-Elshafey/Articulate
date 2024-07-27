abstract class TestDataState {}

final class TestDataInitial extends TestDataState {}

final class TestNewData extends TestDataState {}

final class TestFinished extends TestDataState {}

final class GetDataLoading extends TestDataState {}

final class GetDataSuccess extends TestDataState {}

final class GetDataFailure extends TestDataState {
  final String errorMessage;

  GetDataFailure({required this.errorMessage});
}