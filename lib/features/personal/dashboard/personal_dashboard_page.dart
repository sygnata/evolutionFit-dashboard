import 'package:flutter/material.dart';

class PersonalDashboardPage extends StatelessWidget {
  const PersonalDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Dashboard PERSONAL',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
