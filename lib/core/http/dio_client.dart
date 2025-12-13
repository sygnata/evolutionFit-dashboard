import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../auth/token_storage.dart';
import 'auth_interceptor.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(TokenStorage()),
    );

    return dio;
  }
}
