import 'package:articulate/features/home/data/models/lessons_progress_model.dart';
import 'package:articulate/features/home/data/models/levels_data_model.dart';

abstract class ProgressState {}

final class LessonProgressInitial extends ProgressState {}

final class LessonProgressUpdate extends ProgressState {}

final class LessonProgressGet extends ProgressState {
  final LessonsProgressModel lessonsProgressModel;
  final LevelModel levelModel;
  final int lessonIdex;

  LessonProgressGet(
      {required this.lessonsProgressModel,
      required this.levelModel,
      required this.lessonIdex});
}
