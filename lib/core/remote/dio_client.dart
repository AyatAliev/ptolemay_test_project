import 'package:dio/dio.dart';
import 'package:ptolemay_test_project/core/remote/api_endpoints.dart';
import 'package:ptolemay_test_project/core/remote/logger/logging_interceptor.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
      sendTimeout: 30000
    ),
  )..interceptors.add(LoggingInterceptor());

  Dio get dio => _dio;
}
