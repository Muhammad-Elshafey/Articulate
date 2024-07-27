adsimport 'package:articulate/core/errors/failures.dart';
import 'package:articulate/core/services/service_locator.dart';
import 'package:articulate/core/utils/api_services.dart';
import 'package:articulate/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data_base/cache_helper.dart';
import '../models/auth_model/auth_model.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiServices apiServices;
  AuthRepoImplementation({required this.apiServices});
  @override
  Future<Either<Failure, AuthModel>> signInMethod(
      {required String email, required String password}) async {
    try {
      var data = await apiServices.post(
        endpoint: 'user/login/',
        data: {
          'email': email,
          'password': password,
        },
      );
      final authModel = AuthModel.fromJson(data);
      await getIt<CacheHelper>().saveAuthModel(authModel: authModel);
      return right(authModel);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> signUpMethod(
      {required String name,
      required String password,
      required String email}) async {
    try {
      var data = await apiServices.post(
        endpoint: 'users/',
        data: {
          'email': email,
          'password': password,
          'name': name,
        },
      );

      final authModel = AuthModel.fromJson(data);
      await getIt<CacheHelper>().saveAuthModel(authModel: authModel);
      await getIt<CacheHelper>().saveId(key: 'id', id: '${authModel.user!.id}');
      return right(authModel);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyAccountMethod(
      {required String userId, required String otp}) async {
    try {
      var data = await apiServices.post(
        endpoint: 'user/confirm-email/',
        data: {
          'user_id': userId,
          'otp': otp,
        },
      );
      return right(data['message']);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resendOtp({required String email}) async {
    try {
      var data = await apiServices.post(
        endpoint: 'user/resend-otp/',
        data: {
          'email': email,
        },
      );
      return right(data['message'] == 'تم ارسال الكود الجديد بنجاح'
          ? 'We have sent a new otp'
          : data['message']);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }
}
