import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://youssifallam.pythonanywhere.com/api/';
  final Dio _dio;
  ApiServices({required Dio dio}) : _dio = dio;
  Future<Map<String, dynamic>> getAndReturnMap(
      {required String endpoint, Map<String, dynamic>? headers}) async {
    var response = await _dio.get(
      '$_baseUrl$endpoint',
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<List> getAndReturnList(
      {required String endpoint, Map<String, dynamic>? headers}) async {
    var response = await _dio.get(
      '$_baseUrl$endpoint',
    );

    return response.data as List;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint,
      required Object? data,
      bool needBaseUrl = true}) async {
    var response = await _dio.post(
      needBaseUrl ? '$_baseUrl$endpoint' : endpoint,
      data: data,
      options: Options(
        sendTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endpoint,
      required Object? data,
      Map<String, dynamic>? headers}) async {
    var response = await _dio.put(
      '$_baseUrl$endpoint',
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
