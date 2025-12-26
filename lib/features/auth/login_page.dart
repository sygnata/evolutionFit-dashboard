import '/features/admin/dashboard/admin_dashboard_page.dart';
import '/features/personal/dashboard/personal_dashboard_page.dart';
import 'package:flutter/material.dart';
import '../../core/auth/auth_service.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _controller;

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = LoginController(AuthService());
    _controller.addListener(_onStateChanged);
  }

void _onStateChanged() {
  if (!_controller.state.loading &&
      _controller.state.error == null &&
      _controller.role != null) {

    if (_controller.role == 'ADMIN') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AdminDashboardPage()),
      );
    } else if (_controller.role == 'PERSONAL') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PersonalDashboardPage()),
      );
    }
  }
}


  @override
  void dispose() {
    _controller.removeListener(_onStateChanged);
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = _controller.state;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 380,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'EvolutionFit',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                  const SizedBox(height: 24),

                  if (state.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        state.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.loading
                          ? null
                          : () {
                              _controller.login(
                                _emailController.text,
                                _senhaController.text,
                              );
                            },
                      child: state.loading
                          ? const CircularProgressIndicator()
                          : const Text('Entrar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
