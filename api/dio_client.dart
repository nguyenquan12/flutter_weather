import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _dioClient = DioClient._internal();

  late Dio dio;

  DioClient._internal() {
    dio = Dio(BaseOptions(
      receiveTimeout: const Duration(milliseconds: 30000),
      connectTimeout: const Duration(milliseconds: 30000),
      baseUrl: "https://api.openweathermap.org",
    ));
    dio.interceptors.add(LogInterceptor(request: true));
  }

  static DioClient get instance => _dioClient;
}
