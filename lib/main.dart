import 'package:flutter/material.dart';
import 'features/auth/login_page.dart';

void main() {
  runApp(const EvolutionFitDashboardApp());
}

class EvolutionFitDashboardApp extends StatelessWidget {
  const EvolutionFitDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
