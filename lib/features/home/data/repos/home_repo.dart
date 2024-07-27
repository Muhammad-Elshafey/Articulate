import 'dart:io';
import 'package:articulate/features/home/data/models/lessons_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, String>> getTranscription({
    required String word,
  });
  Future<Either<Failure, String>> getSpeech({
    required String word,
    String language = 'en',
  });
  Future<Either<Failure, List<String>>> assessPronunciation({
    required File audio,
    required String referenceText,
  });
  Future<Either<Failure, List<LessonsModel>>> lessonsDetails(
      {required String endPoint});
  Future<Either<Failure, List<String>>> getLessonData(
      {required int index, required String endPoint});
}
