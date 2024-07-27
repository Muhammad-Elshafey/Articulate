import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/auth_model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> signInMethod({
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthModel>> signUpMethod({
    required String name,
    required String password,
    required String email,
  });
  Future<Either<Failure, String>> verifyAccountMethod({
    required String userId,
    required String otp,
  });
  Future<Either<Failure, String>> resendOtp({
    required String email,
  });
}
