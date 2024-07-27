abstract class LessonDataState {}

final class LessonDataInitial extends LessonDataState {}

final class LessonDataLoading extends LessonDataState {}

final class LessonDataSuccess extends LessonDataState {
  final List<String> data;

  LessonDataSuccess({required this.data});
}

final class LessonDataFailure extends LessonDataState {
  final String errorMessage;

  LessonDataFailure({required this.errorMessage});
}

final class GetNextWord extends LessonDataState {}
