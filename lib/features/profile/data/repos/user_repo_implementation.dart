import 'package:articulate/core/errors/failures.dart';
import 'package:articulate/core/utils/api_services.dart';
import 'package:articulate/features/profile/data/models/user_info.dart';
import 'package:articulate/features/profile/data/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../auth/data/models/auth_model/auth_model.dart';

class UserRepoImplementation implements UserRepo {
  final ApiServices apiServices;
  @override
  UserRepoImplementation({required this.apiServices});
  @override
  Future<Either<Failure, String>> getToken(
      {required String userName, required String password}) async {
    try {
      var data = await apiServices.post(
        endpoint: '/token/',
        data: {
          'username': userName,
          'password': password,
        },
      );
      return right(data['access']);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfo>> getUserInfo(
      {required String bearerToken}) async {
    try {
      var data = await apiServices.getAndReturnMap(
        endpoint: 'userinfo/',
        headers: {
          'Authorization': 'Bearer $bearerToken',
        },
      );
      final UserInfo userInfo = UserInfo.fromJson(data);
      return right(userInfo);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfo>> updateUserData({
    required MultipartFile image,
    required String name,
    required String phoneNumber,
    required String bearerToken,
    AuthModel? authModel,
  }) async {
    try {
      var data = await apiServices.put(
        endpoint: 'userinfo/update/',
        headers: {
          'Authorization': 'Bearer $bearerToken',
        },
        data: {
          'profile_picture': image,
          'name': name,
          'phone_number': phoneNumber,
        },
      );
      final UserInfo userInfo = UserInfo.fromJson(data);
      return right(userInfo);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }
}
