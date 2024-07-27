import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/failures.dart';
import '../models/user_info.dart';

abstract class UserRepo {
  Future<Either<Failure, String>> getToken({
    required String userName,
    required String password,
  });
  Future<Either<Failure, UserInfo>> getUserInfo({
    required String bearerToken,
  });
  Future<Either<Failure, UserInfo>> updateUserData({
    required MultipartFile image,
    required String name,
    required String phoneNumber,
    required String bearerToken,
  });
}
