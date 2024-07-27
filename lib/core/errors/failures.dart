import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Internal Server Error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiSever canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Connection Error');
      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains('SocketException')) {
          return ServerFailure(errorMessage: 'No Internet Connection');
        } else {
          return ServerFailure(errorMessage: dioException.toString());
        }

      default:
        return ServerFailure(errorMessage: dioException.toString());
    }
  }
  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      switch (response['message']) {
        case 'لم يتم العثور على البريد الالكتروني':
          return ServerFailure(errorMessage: 'This email is not registered');
        case 'Email is already registered.':
          return ServerFailure(errorMessage: 'Email is already registered.');
        case 'يرجي تفعيل البريد الالكتروني':
          return ServerFailure(errorMessage: 'Email hasn\'t verified yet');
        case 'خطاء في البريد الالكتروني او كلمة المرور':
          return ServerFailure(errorMessage: 'The password is incorrect');
        case 'تم تاكيد البريد الالكتروني من قبل':
          return ServerFailure(errorMessage: 'The email has already verified');
        case 'الكود الذي ادخلته غير صالح':
          return ServerFailure(errorMessage: 'The otp is incorrect');
        case 'Invalid token':
          return ServerFailure(errorMessage: 'Invalid email');
        case 'كلمة المرور غير متطابقة':
          return ServerFailure(
              errorMessage: 'the password and confirm password doesn\'t match');
        default:
          return ServerFailure(
              errorMessage: response.containsKey("message")
                  ? response['message']
                  : 'Something went wrong!');
      }
    } else if (statusCode == 404) {
      if (response is Map && response.containsKey('message')) {
        if (response['message'] == 'المستخدم غير موجود' ||
            response['message'] == 'User not found.') {
          return ServerFailure(errorMessage: 'User not found');
        }
        return ServerFailure(
            errorMessage: 'Your request not found ,Please try again later!');
      } else {
        return ServerFailure(
            errorMessage: 'the server cannot find the requested resource');
      }
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: 'Internal Server error ,Please try again later!');
    } else {
      return ServerFailure(
          errorMessage: 'Something went wrong!\nstatus code : $statusCode');
    }
  }
}
