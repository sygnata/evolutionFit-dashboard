import 'package:jwt_decoder/jwt_decoder.dart';

class JwtUtils {
  static String getRole(String token) {
    final decodedToken = JwtDecoder.decode(token);
    return decodedToken['role'] as String;
  }

   static bool isExpired(String token) {
    return JwtDecoder.isExpired(token);
  }
}
