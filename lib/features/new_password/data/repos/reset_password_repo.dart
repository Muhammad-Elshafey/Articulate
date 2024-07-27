import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, String>> forgetPassword({
    required String email,
  });
  Future<Either<Failure, String>> resetPassword(
      {required String password,
      required String confirmPassword,
      required String endpoint});
}
