import 'package:articulate/core/errors/failures.dart';
import 'package:articulate/core/utils/api_services.dart';
import 'package:articulate/features/test_feature/data/repos/test_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TestRepoImplementation implements TestRepo {
  final ApiServices apiServices;

  TestRepoImplementation({required this.apiServices});
  @override
  Future<Either<ServerFailure, List<String>>> getReadingTestData() async {
    try {
      var data = await apiServices.getAndReturnMap(
          endpoint: 'v1/Levels/get_all_ReadingTest/');
      final response = data['data'];
      List<String> list = [];
      response.forEach(
        (item) {
          list.add(item['words_and_sents']);
        },
      );
      return Right(list);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }
}
