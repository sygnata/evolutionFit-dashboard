import 'package:dio/dio.dart';
import '../http/dio_client.dart';
import 'token_storage.dart';

class AuthService {
  final Dio _dio = DioClient.create();
  final TokenStorage _storage = TokenStorage();

  Future<String> login(String email, String senha) async {
    final response = await _dio.post(
      '/api/auth/login',
      data: {
        'email': email,
        'senha': senha,
      },
    );

    final token = response.data['token'];
    await _storage.save(token);

    return token;
  }

  Future<void> logout() async {
    await _storage.clear();
  }
}
