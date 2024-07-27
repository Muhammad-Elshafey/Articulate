import 'package:articulate/core/errors/failures.dart';
import 'package:articulate/core/utils/api_services.dart';
import 'package:articulate/features/new_password/data/repos/reset_password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ResetPasswordRepoImplementation implements ResetPasswordRepo {
  final ApiServices apiServices;

  ResetPasswordRepoImplementation({required this.apiServices});
  @override
  Future<Either<Failure, String>> forgetPassword(
      {required String email}) async {
    try {
      var data = await apiServices.post(
        endpoint: 'forgot_password/',
        data: {
          'email': email,
        },
      );
      return right(data['link']);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      {required String password,
      required String confirmPassword,
      required String endpoint}) async {
    try {
      var data = await apiServices.post(
        endpoint: '/reset_password/$endpoint',
        data: {
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );
      String message = '';
      if (data['message'] == 'تم تغيير كلمة المرور بنجاح') {
        message = 'Password has changed successfully';
      }
      return right(message);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioException(ex));
      }
      return left(ServerFailure(errorMessage: ex.toString()));
    }
  }
}
