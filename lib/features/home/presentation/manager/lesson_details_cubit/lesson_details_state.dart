import '../../../data/models/lessons_model.dart';

abstract class LessonDetailsState {}

final class LessonDetailsInitial extends LessonDetailsState {}

final class LessonDetailsLoading extends LessonDetailsState {}

final class LessonDetailsFailure extends LessonDetailsState {
  final String errorMessage;

  LessonDetailsFailure({required this.errorMessage});
}

final class LessonDetailsSuccess extends LessonDetailsState {
  final List<LessonsModel> details;

  LessonDetailsSuccess({required this.details});
}
