import 'package:flutter/material.dart';
import 'features/auth/login_page.dart';
import 'features/bootstrap/bootstrap_page.dart';
import 'features/admin/dashboard/admin_dashboard_page.dart';
import 'features/personal/dashboard/personal_dashboard_page.dart';

void main() {
  runApp(const EvolutionFitDashboardApp());
}

class EvolutionFitDashboardApp extends StatelessWidget {
  const EvolutionFitDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => BootstrapPage(),        
        '/login': (_) => const LoginPage(),   
        '/admin': (_) => const AdminDashboardPage(),
        '/personal': (_) => const PersonalDashboardPage(),
      },
    );
  }
}
