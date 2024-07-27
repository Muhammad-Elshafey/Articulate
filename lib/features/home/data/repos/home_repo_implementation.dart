import 'dart:developer';
import 'dart:io';
import 'package:articulate/core/errors/failures.dart';
import 'package:articulate/core/utils/api_services.dart';
import 'package:articulate/features/home/data/models/lessons_model.dart';
import 'package:articulate/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;
  @override
  HomeRepoImplementation({required this.apiServices});
  @override
  Future<Either<Failure, String>> getSpeech(
      {required String word, String language = 'en'}) async {
    try {
      var data = await apiServices.post(
        endpoint: '/v1/GTTS/text-to-speech/',
        data: {
          'text': word,
          'language': language,
        },
      );
      return right(data['URL']);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getTranscription(
      {required String word}) async {
    try {
      var data = await apiServices.post(
        endpoint: '/v1/GTTS/IPA/',
        data: {
          'text': word,
        },
      );
      return right(data['transcription']);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> assessPronunciation(
      {required File audio, required String referenceText}) async {
    try {
      String fileName = audio.path.split('/').last;
      final FormData formData = FormData.fromMap(
        {
          'Audio': await MultipartFile.fromFile(audio.path, filename: fileName),
          'reference_text': referenceText,
        },
      );
      var data = await apiServices.post(
        data: formData,
        needBaseUrl: false,
        endpoint:
            'https://3bee-196-153-192-69.ngrok-free.app/api/v2/GP/analyze/',
      );
      List<String> response = [];
      response.add(data['data']['similarity_score'].toString());
      response.add(data['data']['phonetic_output']);
      response.add(data['data']['feedback']);
      return Right(response);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LessonsModel>>> lessonsDetails(
      {required String endPoint}) async {
    try {
      var response =
          await apiServices.getAndReturnList(endpoint: '/v1/Levels/$endPoint');
      List<LessonsModel> lessons = [];
      lessons = response.map((item) => LessonsModel.fromJson(item)).toList();
      return Right(lessons);
    } catch (ex) {
      if (ex is DioException) {
        return Left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getLessonData(
      {required int index, required String endPoint}) async {
    try {
      var response = await apiServices.post(
        endpoint: 'v1/Levels/$endPoint',
        data: {
          'sound_id': index,
        },
      );

      List<String> words = [];
      response['data'].forEach((key, value) {
        if (key.startsWith('word_') || key.startsWith('sentence')) {
          words.add(value);
        }
      });
      return Right(words);
    } catch (ex) {
      if (ex is DioException) {
        final ServerFailure serverFailure = ServerFailure.fromDioException(ex);
        log(serverFailure.errorMessage);
        return Left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }
}
