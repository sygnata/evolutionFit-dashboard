import 'package:flutter/material.dart';
import 'jwt_utils.dart';
import 'token_storage.dart';

class AuthGuard {
  final TokenStorage _storage = TokenStorage();

  Future<void> checkAuth(BuildContext context) async {
    final token = await _storage.get();

    if (token == null || JwtUtils.isExpired(token)) {
      _goToLogin(context);
      return;
    }

    final role = JwtUtils.getRole(token);

    if (role == 'ADMIN') {
      _goToAdmin(context);
    } else if (role == 'PERSONAL') {
      _goToPersonal(context);
    } else {
      _goToLogin(context);
    }
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _goToAdmin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/admin');
  }

  void _goToPersonal(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/personal');
  }
}
