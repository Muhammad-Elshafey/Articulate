import 'package:articulate/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TestRepo {
  Future<Either<ServerFailure, List<String>>> getReadingTestData();
}
