import 'package:flutter/material.dart';

void main() {
  runApp(const EvolutionFitDashboardApp());
}

class EvolutionFitDashboardApp extends StatelessWidget {
  const EvolutionFitDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EvolutionFit Dashboard',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text(
            'EvolutionFit Dashboard',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
