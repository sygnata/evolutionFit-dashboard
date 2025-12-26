import 'package:flutter/material.dart';
import '../../core/auth/auth_service.dart';
import 'login_state.dart';
import '../../core/auth/jwt_utils.dart';

class LoginController extends ChangeNotifier {
  final AuthService _authService;

  LoginState _state = const LoginState();
  LoginState get state => _state;

  String? _role;
  String? get role => _role;

  LoginController(this._authService);

  Future<void> login(String email, String senha) async {
    _state = _state.copyWith(loading: true, error: null);
    notifyListeners();

    try {
      final token = await _authService.login(email, senha);
      _role = JwtUtils.getRole(token);

      _state = _state.copyWith(loading: false);
    } catch (e) {
      _state = _state.copyWith(
        loading: false,
        error: 'Email ou senha inválidos',
      );
    }

    notifyListeners();
  }
}